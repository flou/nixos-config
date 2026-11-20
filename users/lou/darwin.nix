{ pkgs, ... }:

{
  # Per-user configuration for lou. Shared setup lives in lib/modules/user.nix.

  launchd.user.agents.proton-pass-ssh-agent.serviceConfig = {
    Label = "com.proton.pass-cli.ssh-agent";
    ProgramArguments = [
      "${pkgs.proton-pass-cli}/bin/pass-cli"
      "ssh-agent"
      "start"
    ];
    RunAtLoad = true;
    KeepAlive = true;
  };
}
