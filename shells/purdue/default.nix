{ pkgs }:
with pkgs;
gcc11Stdenv.mkDerivation {
  name = "shell";
  buildInputs = [
    bison
    ccache
    cmake
    flex
    gnumake
    bc
    yacc
    valgrind
    libnsl
  ];
}
