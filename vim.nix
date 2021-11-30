{ config, pkgs, libs, ... }:
let plugins = pkgs.callPackage ./plugins.nix { };
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = builtins.readFile ./vimrc;
    plugins = plugins.plugins;
    coc = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./coc.json);
    };
  };
}
