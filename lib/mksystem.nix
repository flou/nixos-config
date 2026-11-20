{
  darwin,
  sops,
  hjem,
  ...
}@inputs:

{
  hostname,
  user,
  system ? "aarch64-darwin",
}:

let
  optionalPath = path: if builtins.pathExists path then [ path ] else [ ];
in
darwin.lib.darwinSystem {
  inherit system;

  specialArgs = {
    inherit inputs hostname user;
  };

  modules = [
    sops.darwinModules.default
    hjem.darwinModules.default

    ./modules/hjem.nix
    ./modules/secrets.nix
    ./modules/nixpkgs.nix
    ./modules/packages.nix

    ./modules/darwin.nix
    ./modules/host.nix
    ./modules/user.nix
  ]
  ++ optionalPath ../users/${user}/darwin.nix
  ++ optionalPath ../hosts/${hostname}/default.nix;
}
