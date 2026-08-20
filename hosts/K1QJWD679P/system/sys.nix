{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    _1password-cli
    prek
  ];

  users.users."lou.ferrand" = {
    name = "lou.ferrand";
    home = "/Users/lou.ferrand";
  };

  system.primaryUser = "lou.ferrand";
}
