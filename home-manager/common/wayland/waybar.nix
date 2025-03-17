{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
    };
    settings = {
      topBar = {
        layer = "top";
        position = "top";
        height = 33;
        margin-top = 6;
        margin-left = 10;
        margin-bottom = 0;
        margin-right = 10;
        spacing = 5;
        modules-left = [
          "custom/launcher"
          "cpu"
          "memory"
          "niri/workspaces"
          "custom/media"
        ];
        modules-center = ["niri/window"];
        modules-right = [
          "tray"
          "pulseaudio"
          "privacy"
          "idle_inhibitor"
          "network"
          "clock"
          "custom/power-menu"
        ];
        "niri/window" = {
          format = "{:.40}";
        };
        tray = {
          spacing = 10;
        };
        clock = {
          format = "<span color='#bf616a'> </span>{:%d.%m  %H:%M (%a)}";
        };
        cpu = {
          interval = 30;
          format = "";
          max-length = 10;
          on-click = "";
        };
        memory = {
          interval= 30;
          format= " {}%";
          format-alt=" {used:0.1f}G";
          max-length= 10;
        };
        network = {
          format-wifi= "直 {signalStrength}%";
          format-ethernet= " wired";
          on-click= "bash ~/.config/waybar/scripts/rofi-wifi-menu.sh";
          format-disconnected= "Disconnected  ";
        };
        pulseaudio = {
          format= "{icon} {volume}%";
          format-bluetooth= "  {volume}%";
          format-bluetooth-muted= " ";
          format-muted= "婢";
          format-icons= {
            default= ["" "" ""];
          };
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "󰛐";
            deactivated = "󰛑";
          };
          on-click = "";
        };
        "custom/notifs" = {
          format = "{icon}";
          format-icons = {
            notification = "󰅸";
            none = "󰂜";
            dnd-none = "󱏪";
            dnd-notification = "󱏨";
          };
          tooltip = false;
          return-type = "json";
          exec = "${pkgs.swaynotificationcenter}/bin/swaync-client -swb";
          on-click = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
          on-click-right = "${pkgs.swaynotificationcenter}/bin/swaync-client -d -sw";
          on-click-middle = "${pkgs.swaynotificationcenter}/bin/swaync-client -C";
          escape = true;
        };
        power-profiles-daemon = {
          format = "{profile}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
        };
        privacy = {
          icon-spacing = 4;
          icon-size = 10;
          transition-duration = 100;
          modules = [
            {
              type = "screenshare";
              tooltip = true;
              tooltip-icon-size = 24;
            }
            {
              type = "audio-in";
              tooltip = true;
              tooltip-icon-size = 24;
            }
          ];
        };
      };
    };

    style = pkgs.substituteAll {
      src = ./waybar.css;
      font = config.gtk.font.name;
    };
  };
}
