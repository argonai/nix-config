{
  config,
  pkgs,
  lib,
  ...
}:

{
  xdg.configFile = {
    "Kvantum/kvantum.kvconfig" = {
      enable = true;
      text = ''
        [General]
        theme=KvArcDark
      '';
    };
    "Kvantum/KvArcDark#/KvArcDark#.kvconfig" = {
      enable = true;
      source = ./KvArcDark.kvconfig;
    };
  };

  home.packages = config.qt.style.package;
  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "kvantum-dark";
      package = [
        pkgs.libsForQt5.qtstyleplugin-kvantum
        pkgs.qt6Packages.qtstyleplugin-kvantum
      ];
    };
  };
  gtk = {
    enable = true;
    cursorTheme = {
      name = "capitaine-cursors";
      package = pkgs.capitaine-cursors;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      package = pkgs.arc-theme;
      name = "Arc-Dark";
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    font = {
      package = pkgs.noto-fonts;
      name = "NotoSans";
      size = 10;
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
