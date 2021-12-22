{ pkgs, ... }:
let util = import ../utils.nix;
in {
  plugins = with pkgs.vimPlugins // import ./extraPlugins.nix; [
    goyo
    limelight-vim
    everforest
    vim-scrollstatus
    minimap-vim
    {
      plugin = chadtree;
      config = util.uncomment ./eyecandy/chadtree.vim;
    }
    {
      plugin = neoformat;
      config = util.uncomment ./eyecandy/neoformat.vim;
    }
    {
      plugin = lightline-vim;
      config = util.uncomment ./eyecandy/lightline.vim;
    }
    lightline-gruvbox
    {
      plugin = dkasak-gruvbox;
      config = ''
        let g:gruvbox_transparent_bg = 1
        let g:gruvbox_italic = 1
        let g:gruvbox_invert_selection = 1
        let g:gruvbox_contrast_dark = "soft"
        let g:gruvbox_termcolors = 256
              '';
    }
    {
      plugin = vim-hexokinase;
      config = "let g:Hexokinase_highlighers = ['foreground']";
    }
  ];
}
