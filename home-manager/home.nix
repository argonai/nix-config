# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
let
  discordPackage = pkgs.discord.override {
    withMoonlight = true;
  moonlight = inputs.moonlight.packages.${pkgs.system}.moonlight;
  };
in
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    inputs.moonlight.homeModules.default
    ./common
    ./common/shell
    ./common/wayland
    ./common/nvim
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "argonai";
    homeDirectory = "/home/argonai";
  };
  # Add stuff for your user as you see fit:
  programs.neovim = {
    enable = true;
  };

  # xdg.configFile = {
  #   nvim = {
  #    source = ./conf/nvim;
  #    target = "nvim";
  #    recursive = true;
  #    enable = true;
  #    };
  # };
  # TODO: split packages more

  home.packages = with pkgs; [
    rust-analyzer
    hoppscotch
    gnumake
    unzip
    discordPackage
    lazygit
    clang
    ripgrep
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    gopls
    go
    pyright
    typescript-language-server
    astro-language-server
    inputs.zen-browser.packages."${system}".default
    rofi-wayland
    playerctl
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    terminus_font
    dejavu_fonts
    nodejs_24
    #    powerline-fonts
    font-awesome
    corefonts
    vistafonts
    obsidian
    spotify
  ];
  programs.moonlight = {
    enable = true;
    configs.stable = {
        extensions = {
          alwaysFocus = true;
          moonbase = true;
          dmFavorites = true;
          pronouns = true;
          betterEmbedsYT = true;
          freeScreenShare = true;
          };
      #   repositories = [
      #     "https://moonlight-mod.github.io/extensions-dist/repo.json"
      # ];
    };
  };
  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.kitty = {
    enable = true;
    themeFile = "kanagawa_dragon";
  };
  programs.git = {
    enable = true;
    userName = "argonai";
    userEmail = "argonai@protonmail.com";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "25.05";
}
