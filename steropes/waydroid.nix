{config, libs, imports, modules, pkgs, ...}:

{
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };

}
