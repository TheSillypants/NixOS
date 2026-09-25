{ config, pkgs, inputs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "luka";
  home.homeDirectory = "/home/luka";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    inputs.zen-browser.homeModules.twilight
    inputs.nixvim.homeModules.nixvim
    inputs.noctalia-v4.homeModules.default
    inputs.noctalia-v5.homeModules.default
  ];
  
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };


  # enable nix-index for bash and zsh
  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

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

  programs.obsidian = {
    enable = true;
  };

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

  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      smartindent = false;		
    };
    colorschemes.catppuccin.enable = true;
    
    plugins = {
      vim-suda.enable = true;

      treesitter = {
        enable = true;
	highlight.enable = true;
	indent.enable = false;
	folding.enable = true;
	grammarPackages = config.programs.nixvim.plugins.treesitter.package.allGrammars;			
      };
    };
  };

  programs.noctalia-shell = {
    enable = true;
  };

  programs.noctalia = {
    enable = true;
  };

  services.udiskie = {
    enable = true;
  };
  


  home.packages = [
    pkgs.btop
    pkgs.clementine
    pkgs.picard
    pkgs.eden
    pkgs.manix
    pkgs.tldr
    pkgs.heroic
    pkgs.rar
    pkgs.haruna
    pkgs.signal-desktop
    pkgs.mangohud
    pkgs.nicotine-plus
    pkgs.rpi-imager
    pkgs.processing
    pkgs.aseprite
    pkgs.kdePackages.kamoso
    pkgs.kdePackages.filelight
  ];
}

