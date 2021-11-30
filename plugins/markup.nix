{ pkgs, ... }: {
  plugins = with pkgs.vimPlugins; [
    {
      plugin = vim-pandoc;
      config = builtins.readFile ./markup/pandoc.vim;
    }
    {
      plugin = vim-pandoc-syntax;
      config = builtins.readFile ./markup/pandoc-syntax.vim;
    }
    {
      plugin = vimwiki;
      config = builtins.readFile ./markup/vimwiki.vim;
    }
    {
      plugin = vimtex;
      config = builtins.readFile ./markup/vimtex.vim;
    }
  ];
}
