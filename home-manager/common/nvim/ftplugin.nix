{
  pkgs,
  lib,
  config,
  ...
}:
{
  home.file."${config.xdg.configHome}/nvim/ftplugin/java.lua".text = (
    builtins.readFile (
      pkgs.substituteAll {
        src = ./lua/ftplugin/java.lua;
        jdtls = pkgs.jdt-language-server;
        cachedir = config.xdg.cacheHome;
        jdk23 = pkgs.jdk23_headless;
        javacfg = ./resource/java-eclipse.xml;
        javatest = pkgs.vscode-extensions.vscjava.vscode-java-test;
        javadebug = pkgs.vscode-extensions.vscjava.vscode-java-debug;
        eclipsedir = config.xdg.configHome + "/eclipse/";
      }
    )
  );
  home.file."${config.xdg.configHome}/nvim/ftplugin/nix.lua".source = ./lua/ftplugin/nix.lua;
  home.file."${config.xdg.configHome}/nvim/ftplugin/text.lua".source = ./lua/ftplugin/text.lua;
  home.file."${config.xdg.configHome}/nvim/ftplugin/markdown.lua".source = ./lua/ftplugin/text.lua;
  home.file."${config.xdg.configHome}/nvim/ftplugin/php.lua".source = ./lua/ftplugin/php.lua;
  home.file."${config.xdg.configHome}/nvim/ftplugin/typescriptreact.lua".source = ./lua/ftplugin/typescriptreact.lua;
  home.file."${config.xdg.configHome}/nvim/ftplugin/typescript.lua".source = ./lua/ftplugin/typescriptreact.lua;
  home.file."${config.xdg.configHome}/nvim/ftplugin/javascript.lua".source = ./lua/ftplugin/typescriptreact.lua;
}
