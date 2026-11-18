{ config, pkgs, inputs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "obsidian"
    "rar"
    "aseprite"
    "steam"
    "steam-unwrapped"
  ];
}
