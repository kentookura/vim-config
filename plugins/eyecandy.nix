{ pkgs, ... }: {
  plugins = with pkgs.vimPlugins // import ./extraPlugins.nix; [
    {
      plugin = vim-startify;
      config = builtins.readFile ./eyecandy/startify.vim;
    }
    {
      plugin = chadtree;
      config = builtins.readFile ./eyecandy/chadtree.vim;
    }
    {
      plugin = neoformat;
      config = builtins.readFile ./eyecandy/neoformat.vim;
    }
    {
      plugin = limelight-vim;
      config = "";
    }
    {
      plugin = dkasak-gruvbox;
      config = "";
    }
    {
      plugin = lightline-vim;
      config = builtins.readFile ./eyecandy/lightline.vim;
    }
    {
      plugin = goyo;
      config = "";
    }
  ];

}
