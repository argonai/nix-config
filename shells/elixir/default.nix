{ pkgs }:
with pkgs;
stdenvNoCC.mkDerivation {
  name = "shell";
  buildInputs = [
    elixir
    gcc
    inotify-tools
    postgresql
    mise
  ];
}
