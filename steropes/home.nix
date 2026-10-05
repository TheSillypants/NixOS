{config, pkgs, inputs, lib, ...}:

{
  home.username = "luka";
  home.homeDirectory = "/home/luka";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    inputs.zen-browser.homeModules.twilight
    ../modules/hm-zen.nix
  ];

  programs.ssh = {
    enable = true;

    settings = {
      "github.com" = {
        hostName = "github.com";
	user = "git";
	identityFile = "/run/agenix/githubssh";
      };
    };
  };

  home.packages = [
    pkgs.bottles
    pkgs.tldr
  ];
}
