# let
#   pkgs = import <nixpkgs> {};
# in
{ pkgs ? import <nixpkgs> {} }:


pkgs.stdenv.mkDerivation {
  name = "hello-world";
  src = ./src;

  buildInputs = with pkgs; [
    ncurses
    cowsay
  ];

  nativeBuildInputs = with pkgs; [
    makeWrapper
  ];

  phases = [
    "unpackPhase"
    "buildPhase"
    "installPhase"
    # "postFixup"
    # "myPersonalConfusingPhase"
  ];

  buildPhase = ''
    g++ hello-world.cpp -o hello-world
  '';

  # buildPhase = ''
  #   g++ hello-world.cpp -o hello-world -lncurses
  # '';

  installPhase = ''
    mkdir -p $out/bin
    cp hello-world $out/bin
  '';

  postFixup = ''
    wrapProgram $out/bin/hello-world \
      --set PATH ${pkgs.lib.makeBinPath (with pkgs; [
        cowsay
      ])}
  '';

  # myPersonalConfusingPhase = ''
  #   echo "hi" > $out/hi
  # '';
}
