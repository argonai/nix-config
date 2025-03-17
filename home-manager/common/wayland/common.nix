{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    dex
    glfw-wayland
    grim
    eog
    lxqt.lxqt-openssh-askpass
    slurp
    wayland
    wdisplays
    wl-clipboard
  ];
  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    _JAVA_AWT_WM_NONREPARENTING = "1";
    NIXOS_OZONE_WL = "1";
    SDL_VIDEODRIVER = "wayland";
    XCOMPOSEFILE = "${config.xdg.configHome}/xcompose";
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = config.gtk.font.name;
        dpi-aware = "no"; # wm does this for us
        icon-theme = config.gtk.iconTheme.name;
        terminal = "${config.programs.kitty.package}/bin/kitty";
        width = 50;
      };
      colors = {
        background = "2e3440f0";
        border = "88c0d0f0";
        selection = "00bcd4f0";
        text = "888888f0";
        selection-text = "eeeeeef0";
        match = "fffffff0";
        selection-match = "fffffff0";
      };
    };
  };

}
