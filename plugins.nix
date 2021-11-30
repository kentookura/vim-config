{ lib, pkgs, ... }:
let
  plugs = pkgs.vimPlugins // import ./plugins/extraPlugins.nix;
  haskell-plugins = pkgs.callPackage ./plugins/haskell-plugins.nix { };
  markup = pkgs.callPackage ./plugins/markup.nix { };
  coc-plugins = pkgs.callPackage ./plugins/coc-plugins.nix { };
  eyecandy = pkgs.callPackage ./plugins/eyecandy.nix { };
in {
  plugins = with plugs;
    haskell-plugins.plugins ++ coc-plugins.plugins ++ eyecandy.plugins
    ++ markup.plugins ++ [
      nvim-treesitter
      vim-eunuch
      gx-extended
      tabular
      neomake
      ack-vim
      yuck-vim
      emmet-vim
      nvim-lspconfig
      nvim-compe
      vim-vsnip
      switch-vim
      plenary-nvim
      lean-nvim
      vim-surround
      auto-pairs
      fzf-vim
      vim-nix
    ];
}
