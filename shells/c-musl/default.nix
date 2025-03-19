{ pkgs }:
with pkgs;
stdenvNoCC.mkDerivation {
  name = "shell";
  buildInputs = [
    bison
    cmake
    flex
    musl
    gnumake
    SDL2.dev
    valgrind
    wayland.dev
    xorg.libX11
    xorg.libXext
    yacc
  ];
}
