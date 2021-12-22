{ pkgs, ... }:
let util = import ../utils.nix;
in {
  plugins = with pkgs.vimPlugins; [
    {
      plugin = vim-pandoc;
      config = util.uncomment ./markup/pandoc.vim;
    }
    {
      plugin = vim-pandoc-syntax;
      config = util.uncomment ./markup/pandoc-syntax.vim;
    }
    {
      plugin = vimwiki;
      config = util.uncomment ./markup/vimwiki.vim;
    }
    {
      plugin = vimtex;
      config = util.uncomment ./markup/vimtex.vim;
    }
  ];
}
