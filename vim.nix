{ config, pkgs, libs, ... }:
let plugins = pkgs.callPackage ./plugins.nix { };
in {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    plugins = plugins.plugins;
    coc = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./coc.json);
    };
    extraConfig = (pkgs.callPackage ./vimrc.nix { }).extraConfig
      + builtins.readFile ./vimrc;
  };
}
