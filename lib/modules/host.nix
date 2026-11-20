{ hostname, ... }:

{
  networking = {
    computerName = hostname;
    hostName = hostname;
    localHostName = hostname;

    applicationFirewall = {
      enable = true;
      blockAllIncoming = false;
      enableStealthMode = true;
      allowSigned = true;
      allowSignedApp = true;
    };
  };

  system.defaults.smb.NetBIOSName = hostname;
}
