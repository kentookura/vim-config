{ config, pkgs, libs, lib, ... }:
let
  uncomment = import ./utils.nix;
  plugins = pkgs.callPackage ./plugins.nix { };
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = plugins.plugins;
    package = pkgs.neovim-nightly;
    coc = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./coc.json);
    };
    extraConfig = uncomment.uncomment ./vimrc;
  };
}
