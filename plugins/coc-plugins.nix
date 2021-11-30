{ pkgs, ... }: {
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
      config = builtins.readFile ./coc/coc.vim;
    }
  ];
}
