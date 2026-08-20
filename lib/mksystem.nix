{ self, nixpkgs, darwin, agenix, hjem, ... }@inputs:

name:
{
  user,
  system,
  profile ? "nixos"
}:

assert builtins.elem profile [ "nixos" "darwin" "wsl" ];

let
  hjemModule = if profile == "darwin" then hjem.darwinModules else hjem.nixosModules;
  ageModule = if profile == "darwin" then agenix.darwinModules else agenix.nixosModules;
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
    ageModule.default
    hjemModule.default
    ../hosts/${name}/default.nix
    ../users/${user}/${if profile == "darwin" then "darwin" else "nixos"}.nix
    (import ./modules/hjem.nix { inherit specialArgs; })
    (import ./modules/nixpkgs.nix { inherit inputs; })
    (import ./modules/agenix.nix specialArgs)
    (import ./modules/darwin.nix)
  ];
}
