{ pkgs, ... }:

{
  # K1QJWD679P-specific packages.
  environment.systemPackages = with pkgs; [
    _1password-cli
    prek
  ];
}
