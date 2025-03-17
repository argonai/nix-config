{
  config,
  pkgs,
  lib,
  ...
}:
let
  footnotify = pkgs.writeShellScriptBin "foot-notify" ''
    ${pkgs.libnotify}/bin/notify-send -a $1 -i utilities-terminal "$2" "$3"
    ${pkgs.curl}/bin/curl -H "Title: $2" -d "$3" "https://ntfy.ersei.net/$(cat ${config.xdg.configHome}/foot/ntfy-token.txt)"
  '';
in
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
  programs.foot = {
    enable = true;
    package = pkgs.foot;
    settings = {
      main = {
        font = "DroidSansM Nerd Font Mono:size=10";
        pad = "0x0 center";
        bold-text-in-bright = "yes";
        dpi-aware = "no"; # our wm does this for us
      };
      desktop-notifications = {
        command = "${footnotify}/bin/foot-notify \${app-id} \${title} \${body}";
        inhibit-when-focused = "yes";
      };
      scrollback = {
        lines = 100000;
        multiplier = 5.0;
      };
      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "yes";
      };
      colors = {
        alpha = 0.80;
        foreground = "ffffff";
        background = "000000";
        ## Normal/regular colors (color palette 0-7)
        regular0 = "000000"; # black
        regular1 = "aa0000"; # red
        regular2 = "00aa00"; # green
        regular3 = "aa5500"; # yellow
        regular4 = "89ddff"; # blue
        regular5 = "aa00aa"; # magenta
        regular6 = "00aaaa"; # cyan
        regular7 = "aaaaaa"; # white

        ##Bright colors (color palette 8-15)
        bright0 = "555555"; # bright black
        bright1 = "ff5555"; # bright red
        bright2 = "55ff55"; # bright green
        bright3 = "ffff55"; # bright yellow
        bright4 = "5555ff"; # bright blue
        bright5 = "ff55ff"; # bright magenta
        bright6 = "55ffff"; # bright cyan
        bright7 = "ffffff"; # bright white
      };
      key-bindings = {
        prompt-prev = "Control+Shift+z";
        prompt-next = "Control+Shift+x";
        unicode-input = "Control+Shift+u";
      };
    };
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = config.gtk.font.name;
        dpi-aware = "no"; # wm does this for us
        icon-theme = config.gtk.iconTheme.name;
        terminal = "${config.programs.foot.package}/bin/foot";
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

  services.gammastep = {
    enable = true;
    provider = "geoclue2";
  };

  services.swaync = {
    enable = true;
    style = ./swaync.css;
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-positionX = "left";
      notification-2fa-action = false;
      control-center-width = 500;
      layer = "overlay";
      control-center-layer = "overlay";
      widgets = [
        "title"
        "dnd"
        "mpris"
        "notifications"
      ];
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      notification-window-width = 500;
      keyboard-shortcuts = true;
      image-visibility = "always";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
    };
  };

  # Does not work in firefox
  xdg.configFile."xcompose" = {
    text = ''
      include "%L"

      # Greek characters
      <Multi_key> <g> <a> : "α"
      <Multi_key> <g> <b> : "β"
      <Multi_key> <g> <d> : "Δ"
      <Multi_key> <g> <g> : "γ"
      <Multi_key> <g> <p> : "π"
    '';
  };
}
