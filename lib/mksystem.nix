{
  darwin,
  hjem,
  ...
}@inputs:

{
  hostname,
  user,
}:

let
  optionalPath = path: if builtins.pathExists path then [ path ] else [ ];
in
darwin.lib.darwinSystem {
  specialArgs = {
    inherit inputs hostname user;
  };

  modules = [
    hjem.darwinModules.default

    ./modules/hjem.nix
    ./modules/nixpkgs.nix
    ./modules/packages.nix

    ./modules/darwin.nix
    ./modules/host.nix
    ./modules/user.nix
  ]
  ++ optionalPath ../users/${user}/darwin.nix
  ++ optionalPath ../hosts/${hostname}/default.nix;
}
