{ config, profile, user, ... }:

let
  shared = {
    owner = config.users.users.${user}.name;
    group = if profile == "darwin" then "staff" else "users";
    mode = "0400";
  };
in
{
  sops.secrets = { };
}
