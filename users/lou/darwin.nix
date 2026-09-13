{ config, ... }:

{
  users.users.lou = {
    home = "/Users/lou";
  };

  sops.age.sshKeyPaths = [
    "${config.users.users.lou.home}/.ssh/id_ed25519"
  ];

  hjem.users.lou = {
    enable = true;

    # files = {
    #   ".config/git/config".text = ''
    #     [user]
    #       name = "lou"
    #       email = "lou@example.com"
    #   '';
    # };
  };
}
