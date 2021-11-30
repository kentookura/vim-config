{ pkgs, lib, ... }:
with builtins;
let
  set = setting: "set ${setting}";
  settings = [
    "autoread"
    "laststatus=2"
    "clipboard+=unnamedplus"
    "encoding=utf-8"
    "fileencoding=utf-8"
    "foldmethod=syntax"
    "hidden"
    "nowrap"
    "hlsearch"
    "ignorecase smartcase"
    "expandtab ts=2 sts=2 sw=2"
    "autoindent"
    "smarttab"
    "foldmethod=indent"
    "foldnestmax=10"
    "nofoldenable"
    "foldlevel=2"
    "nobackup"
    "noswapfile"
    "nowritebackup"
    "number relativenumber"
    "path+=**"
    "so=10"
    "splitbelow"
    "splitright"
    "wildignore+=*.opus,*.flac,*.pdf,*.jpg,*.png,*.so,*.swp,*.zip,*.gzip,*.bz2,*.tar,*.xz,*.lrzip,*.lrz,*.mp3,*.ogg,*.mp4,*.gif,*.jpeg,*.webm,*.hi,*.o"
    "wildmenu"
    "lazyredraw"
    "magic"
    "showmatch"
    "mat=2"
  ];
in {
  extraConfig = lib.strings.concatStringsSep "\n" (builtins.map set settings);
}
