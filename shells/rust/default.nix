{ pkgs }:
with pkgs;
stdenvNoCC.mkDerivation {
  name = "shell";
  buildInputs = [
    rustc
    rustfmt
    rust-analyzer
    cargo
    protobuf
    gcc13
    cargo-ndk
  ];
}
