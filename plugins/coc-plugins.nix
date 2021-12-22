{ pkgs, lib, ... }:
let lib = import ../utils.nix;
in {
  plugins = with pkgs.vimPlugins; [
    coc-json
    coc-markdownlint
    coc-pyright
    coc-nvim
    coc-vimtex
    coc-prettier
    coc-yaml
    coc-vimlsp
    coc-tsserver
    coc-eslint
    coc-json
    {
      plugin = coc-nvim;
      config = lib.uncomment ./coc/coc.vim;
    }
  ];
}
