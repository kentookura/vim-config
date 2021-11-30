with import <nixpkgs> { };

let inherit (vimUtils) buildVimPluginFrom2Nix;
in {
  "dkasak-gruvbox" = buildVimPluginFrom2Nix {
    pname = "dkasak-gruvbox";
    version = "";
    src = fetchgit {
      url = "https://github.com/dkasak/gruvbox";
      rev = "55f37b6fb6210b28f73ad331e6c138f8ae643538";
      sha256 = "2WyXVkJXwPCZ6p3QvDP03ISYOgPNvVRBC3kXemXLgNg=";
    };
  };
  "agdavim" = buildVimPluginFrom2Nix {
    pname = "agdavim";
    version = "";
    src = fetchgit {
      url = "https://github.com/derekelkins/agda-vim";
      rev = "4a0f475aaef756702222bdd5b01e25f814f5691f";
      sha256 = "zsH3M+nAR5HX0NZbOZfxIgOZU1bFj/GZf6J44tvjjzQ=";

    };
  };
  "gx-extended" = buildVimPluginFrom2Nix {
    pname = "gx-extended";
    version = "";
    src = fetchgit {
      url = "https://github.com/stsewd/gx-extended.vim";
      rev = "a88e9b60b0b392de778d2843ab0ab9bbcfcc2377";
      sha256 = "DJM3vIHRL4AC1yOFT+Xdvy4fK6is2NbwRbPknUOvOlQ=";
    };
  };
  "switch-vim" = buildVimPluginFrom2Nix {
    pname = "switch-vim";
    version = "";
    src = fetchgit {
      url = "https://github.com/AndrewRadev/switch.vim";
      rev = "d9a8cf6171a4ac262c1cf4795984091b61989785";
      sha256 = "yqLyT7rBmzd87XnRPdVD1iR2ozLzI9ydORep/H1FVDY=";
    };
  };

  "parinfer-rust" = buildVimPluginFrom2Nix {
    pname = "parinfer-rust";
    version = "";
    src = fetchgit {
      url = "https://github.com/eraserhd/parinfer-rust";
      rev = "5def45e1cbbc4f690fe70e44c786ad6bf9437476";
      sha256 = "Jpnx31vVg0UrZSf/VNiELoCj7G23V5AJavgSt56CgQ8=";
    };
  };

  "yuck-vim" = buildVimPluginFrom2Nix {
    pname = "yuck-vim";
    version = "";
    src = fetchgit {
      url = "https://github.com/elkowar/yuck.vim";
      rev = "6dc3da77c53820c32648cf67cbdbdfb6994f4e08";
      sha256 = "lp7qJWkvelVfoLCyI0aAiajTC+0W1BzDhmtta7tnICE=";
    };
  };
  "lean-nvim" = buildVimPluginFrom2Nix {
    pname = "lean-nvim";
    version = "";
    src = fetchgit {
      url = "https://github.com/Julian/lean.nvim";
      rev = "188afcb8f7d3dba9e91f6a030864865a227815a5";
      sha256 = "j+Ct7vgJD/g1/HnZAj57VkdPQ/Ddma+DG6zaGZjtYhU=";
    };
  };
}
