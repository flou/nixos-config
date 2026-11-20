{
  description = "Lou's nix-darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts/main";

    darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops = {
      url = "github:mic92/sops-nix/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    let
      mkSystem = import ./lib/mksystem.nix inputs;

      # hostname -> primary user
      hosts = {
        Majula = "lou";
        K1QJWD679P = "lou.ferrand";
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" ];

      perSystem =
        { pkgs, ... }:
        {
          formatter = pkgs.nixfmt-tree;
        };

      flake.darwinConfigurations = builtins.mapAttrs (
        hostname: user: mkSystem { inherit hostname user; }
      ) hosts;
    };
}
