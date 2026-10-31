{config, inputs, libs, modulesPath, ...}:

{
  environment.persistence."/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/lib/networkManager"
      "/var/lib/bluetooth"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode ="u-rwx,g=rx,o="; }
      "/var/lib/AccountsService"
      "/home"
      "/etc/ssh"
    ];

    files = [
      "/etc/machine-id"
    ];
  };
}
