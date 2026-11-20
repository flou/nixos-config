{ pkgs, ... }:

{
  # Majula-specific packages.
  networking.knownNetworkServices = [ "Wi-Fi" ];
  networking.dns = [
    "1.1.1.1"
    "1.0.0.1"
  ];

  environment.systemPackages = with pkgs; [
    opencode
    proton-pass-cli
    qmk
  ];
}
