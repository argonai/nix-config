{ pkgs }:
with pkgs;
stdenv.mkDerivation {
  name = "shell";
  buildInputs = with python3Packages; [
    python3
    torch
    ipython
    pandas
    scikit-learn
    pillow
    numpy
  ];
}
