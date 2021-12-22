let lib = import <nixpkgs/lib>;
in {
  uncomment = path:
    builtins.concatStringsSep "\n"
    ((lib.filter (line: line != "" && !(lib.hasPrefix ''"'' line)))
      (lib.splitString "\n" (builtins.readFile path)));
  mklua = lua: ''
    lua <<EOF
    ${lua}
    EOF
  '';
}
