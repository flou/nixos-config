{ pkgs, ... }:

{
  # Majula-specific packages.
  environment.systemPackages = with pkgs; [
    opencode
    proton-pass-cli
  ];
}
