{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.starship.enable = true;
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "ssh" "ssh-agent" "starship"];
    }; 

    plugins = [
      {
	# will source zsh-autosuggestions.plugin.zsh
	name = "zsh-autosuggestions";
	src = pkgs.fetchFromGitHub {
	  owner = "zsh-users";
	  repo = "zsh-autosuggestions";
	  rev = "v0.4.0";
	  sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
	};
      }
    ];
  };
}
