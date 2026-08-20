{
  networking = {
    computerName = "K1QJWD679P";
    hostName = "K1QJWD679P";
    localHostName = "K1QJWD679P";
    search = [ "K1QJWD679P.local" ];

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

  system.defaults.smb.NetBIOSName = "K1QJWD679P";
}
