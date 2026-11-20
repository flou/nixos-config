{ user, ... }:

let
  home = "/Users/${user}";
in
{
  users.users.${user} = {
    name = user;
    inherit home;
  };

  system.primaryUser = user;

  sops.age.sshKeyPaths = [ "${home}/.ssh/id_ed25519" ];

  hjem.users.${user}.enable = true;
}
