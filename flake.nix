{
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

  outputs = inputs@{ flake-parts, ... }:
    let
      mkSystem = import ./lib/mksystem.nix inputs;
    in flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" ];

      flake = {
        darwinConfigurations = {
          Majula = mkSystem "Majula" {
            system = "aarch64-darwin";
            profile = "darwin";
            user = "lou";
          };

          K1QJWD679P = mkSystem "K1QJWD679P" {
            system = "aarch64-darwin";
            profile = "darwin";
            user = "lou.ferrand";
          };
        };
      };
    };
}
