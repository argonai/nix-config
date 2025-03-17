{
  config,
  pkgs,
  lib,
  ...
}:
{
  fonts.fontconfig.enable = true;
  home.packages =
    with pkgs;
    [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      terminus_font
      dejavu_fonts
      #    powerline-fonts
      font-awesome
      corefonts
      vistafonts
    ]
    ++ (builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts));

  xdg.configFile = {
    "fontconfig/conf.d/99-custom-font-rules.conf" = {
      enable = true;
      source = ./fonts.conf;
    };
  };
}
