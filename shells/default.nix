{ pkgs }:
{
  default = pkgs.mkShell {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes repl-flake";
    nativeBuildInputs = with pkgs; [
      nix
      home-manager
      git
    ];
  };
  c = import ./c { inherit pkgs; };
  c686 = import ./c { pkgs = pkgs.pkgsi686Linux; };
  c-musl = import ./c-musl { inherit pkgs; };
  elixir = import ./elixir { inherit pkgs; };
  purdue = import ./purdue { inherit pkgs; };
  pytorch = import ./pytorch { inherit pkgs; };
  rust = import ./rust { inherit pkgs; };
}
