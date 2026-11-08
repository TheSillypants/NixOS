{ config, pkgs, inputs, lib, ... }:

{

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;

      format = lib.concatStrings [
        "$all"
	"$hostname"
	"$character"
      ];

      nix_shell = {
        heuristic = true;
      };
      hostname = {
        ssh_only = false;
	format = "[$ssh_symbol$hostname]($style) ";
      };
    };
  };

}
