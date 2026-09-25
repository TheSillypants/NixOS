{
  description = "My NixOS Config";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager.url = "github:nix-community/home-manager";

    nixos-hardware = {
      url = "github:Nixos/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
	home-manager.follows = "home-manager";
      };
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    noctalia-v4 = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-v5 = {
      url = "github:noctalia-dev/noctalia";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = inputs@{self, nixpkgs, home-manager, nixos-hardware, nixvim, nix-index-database, agenix, ...}: {
    nixosConfigurations.SillyNix = nixpkgs.lib.nixosSystem {
     system = "x86_64-linux";
     specialArgs = { inherit inputs; };
     modules = [
       ./configuration.nix
       ./hardware-configuration.nix
       home-manager.nixosModules.home-manager
       nixos-hardware.nixosModules.framework-16-7040-amd
       agenix.nixosModules.default
       {
         home-manager.useGlobalPkgs = true;
	 home-manager.useUserPackages = true;
	 home-manager.extraSpecialArgs = { inherit inputs; };
	 home-manager.users.luka = ./home.nix;
       }
       nix-index-database.nixosModules.default
       { programs.nix-index-database.comma.enable = true; }
     ];
    };
  };
}
