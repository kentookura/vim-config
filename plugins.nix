{ lib, pkgs, ... }:
let
  plugs = pkgs.vimPlugins // import ./plugins/extraPlugins.nix;
  haskell-plugins = pkgs.callPackage ./plugins/haskell-plugins.nix { };
  markup = pkgs.callPackage ./plugins/markup.nix { };
  coc-plugins = pkgs.callPackage ./plugins/coc-plugins.nix { };
  eyecandy = pkgs.callPackage ./plugins/eyecandy.nix { };

  mklua = lua: ''
    lua <<EOF
    ${lua}
    EOF
  '';

  lean = with plugs; {
    plugin = lean-nvim;
    config = mklua (builtins.readFile ./lean.lua);
  };
  treesitter = with plugs; {
    plugin = nvim-treesitter;
    config = mklua (builtins.readFile ./treesitter.lua);
  };
in {
  plugins = with plugs;
    haskell-plugins.plugins ++ coc-plugins.plugins ++ eyecandy.plugins
    ++ markup.plugins ++ [
      treesitter
      lean
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
      vim-surround
      auto-pairs
      fzf-vim
      vim-nix
    ];
}
