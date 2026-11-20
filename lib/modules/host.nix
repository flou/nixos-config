{ hostname, ... }:

{
  networking = {
    computerName = hostname;
    hostName = hostname;
    localHostName = hostname;
    search = [ "${hostname}.local" ];

    knownNetworkServices = [ "Wi-Fi" ];
    dns = [
      "1.1.1.1"
      "1.0.0.1"
    ];

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
