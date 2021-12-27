{ stdenv }:

stdenv.mkDerivation {
    name = "ericvolp12-zsh-theme";
    src = ./ericvolp12.zsh-theme;
    dontUnpack = true;
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/zsh/themes
      cp $src $out/share/zsh/themes/ericvolp12.zsh-theme
    '';
}
