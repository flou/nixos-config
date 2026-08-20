{ self, nixpkgs, darwin, sops, hjem, ... }@inputs:

name:
{
  user,
  system,
  profile ? "nixos"
}:

assert builtins.elem profile [ "nixos" "darwin" "wsl" ];

let
  hjemModule = if profile == "darwin" then hjem.darwinModules else hjem.nixosModules;
  sopsModule = if profile == "darwin" then sops.darwinModules else sops.nixosModules;
  systemFunc = if profile == "darwin" then darwin.lib.darwinSystem else nixpkgs.lib.nixosSystem;
in systemFunc rec {
  inherit system;

  specialArgs = {
    inherit self;
    inherit inputs;
    inherit profile;
    inherit user;
  };

  modules = [
    sopsModule.default
    hjemModule.default
    (import ./modules/hjem.nix { inherit specialArgs; })
    ./modules/secrets.nix
    (import ./modules/nixpkgs.nix { inherit inputs; })
    ../hosts/${name}/default.nix
    ../users/${user}/${if profile == "darwin" then "darwin" else "nixos"}.nix
    (import ./modules/darwin.nix)
  ];
}
