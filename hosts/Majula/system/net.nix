{
  networking = {
    computerName = "Majula";
    hostName = "Majula";
    localHostName = "Majula";
    search = [ "Majula.local" ];

    knownNetworkServices = [ "Wi-Fi" ];

    dns = [
      "1.1.1.1"
      "1.0.0.1"
    ];

    applicationFirewall = {
      enable = true;
      blockAllIncoming = false;
      enableStealthMode = true;
      allowSignedApp = true;
      allowSigned = true;
    };
  };

  system.defaults.smb.NetBIOSName = "Majula";
}
