{ config, pkgs, inputs, lib, ... }:

{
  programs.ssh = {
    enable = true;

    enableDefaultConfig = false;

    settings."github.com" = {
      hostName = "github.com";
      user = "git";
      identityFile = "/run/agenix/githubssh";
    };
  };

}
