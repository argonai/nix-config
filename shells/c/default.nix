{ pkgs }:
with pkgs;
stdenvNoCC.mkDerivation {
  name = "shell";
  buildInputs = [
    bear
    bison
    cmake
    flex
    gcc
    gnumake
    SDL2.dev
    valgrind
    wayland.dev
    xorg.libX11
    xorg.libXext
  ];
}
