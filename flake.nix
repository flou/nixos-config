{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.darwin.follows = "darwin";
      inputs.home-manager.follows = "";
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
