{ pkgs, ... }: {
  plugins = with pkgs.vimPlugins // import ./extraPlugins.nix; [
    haskell-vim
    hlint-refactor-vim
    ghcid
    agdavim
    vim-stylish-haskell
  ];
}
