{
  config,
  pkgs,
  lib,
  ...
}:
let
  swayexitify = pkgs.writeShellScriptBin "swayexitify" ''
    lock() {
      ${pkgs.swaylock}/bin/swaylock
    }

    case "$1" in
        lock)
            lock &
            ;;
        logout)
            ${pkgs.sway}/bin/swaymsg exit
            ;;
        suspend)
            ${pkgs.systemd}/bin/systemctl suspend
            ;;
        hibernate)
            ${pkgs.systemd}/bin/systemctl hibernate
            ;;
        reboot)
            ${pkgs.systemd}/bin/systemctl reboot
            ;;
        shutdown)
            ${pkgs.systemd}/bin/systemctl poweroff
            ;;
        *)
            echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
            exit 2
    esac

    exit 0
  '';
  niriswitch = pkgs.writeShellScriptBin "niriswitch" ''
    windows=$(${pkgs.niri}/bin/niri msg -j windows)
    ${pkgs.niri}/bin/niri msg action focus-window --id \
      $(echo "$windows" | 
        ${pkgs.jq}/bin/jq ".[$(echo "$windows" | ${pkgs.jq}/bin/jq -r 'map("\(.title // .app_id)\u0000icon\u001f\(.app_id)") | .[]' | ${pkgs.fuzzel}/bin/fuzzel -d --index)].id"
      )
  '';
in
{
  wayland.windowManager.niri = {
    enable = true;
    configFile = pkgs.replaceVars ./niri.kdl {
      blueman = "${pkgs.blueman}";
      swaync = "${pkgs.swaynotificationcenter}";
      swaybg = "${pkgs.swaybg}";
      copyq = "${pkgs.copyq}";
      cursorTheme = "${config.gtk.cursorTheme.name}";
      kitty = "${pkgs.kitty}";
      fuzzel = "${pkgs.fuzzel}";
      # swaylock = "${pkgs.swaylock}";
      wireplumber = "${pkgs.wireplumber}";
      playerctl = "${pkgs.playerctl}";
      brightnessctl = "${pkgs.brightnessctl}";
      # bemoji = "${pkgs.bemoji}";
      swayexitify = "${swayexitify}";
      wallpaper = ../wallpapers/ranni_saberiii.jpg;
      # swayr = "${pkgs.swayr}";
      xwaylandSatellite = "${pkgs.xwayland-satellite}";
      # niriswitch = "${niriswitch}";
      waybar = "${pkgs.waybar}";
      DEFAULT_AUDIO_SINK = null;
DEFAULT_AUDIO_SOURCE = null;
    };
  };

  services.swayidle = {
    enable = true;
    systemdTarget = "graphical-session.target";
    extraArgs = [ "-w" ];
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
    timeouts = [
      {
        timeout = 300;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        timeout = 305;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors";
        resumeCommand = "${pkgs.niri}/bin/niri msg action power-on-monitors";
      }
    ];
  };

  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000";
    };
  };
}
