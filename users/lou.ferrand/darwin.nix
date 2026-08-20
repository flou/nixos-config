{ config, ... }:

{
  users.users."lou.ferrand" = {
    home = "/Users/lou.ferrand";
  };

  sops.age.sshKeyPaths = [
    "${config.users.users.lou.ferrand.home}/.ssh/id_ed25519"
  ];

  hjem.users."lou.ferrand" = {
    enable = true;

    files = {
      ".config/git/config".text = ''
        [user]
          name = "lou.ferrand"
          email = "lou.ferrand@example.com"
      '';
    };
  };
}
