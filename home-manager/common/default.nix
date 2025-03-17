{
  config,
  pkgs,
  lib,
  outputs,
  ...
}:

{
  imports = (builtins.attrValues outputs.homeManagerModules) ++ [ ../modules/disabled.nix ];
  home.sessionVariables = {
    GOTOOLCHAIN = "path"; # https://tip.golang.org/doc/toolchain
    DOTNET_CLI_TELEMETRY_OPTOUT = 1;
    PAGER = "less -LSRc --mouse";

    # Keep your mitts off of my home directory
    CARGO_HOME = "${config.xdg.cacheHome}/cargo";
    CUDA_CACHE_PATH = "${config.xdg.cacheHome}/nv";
    DOTNET_CLI_HOME = "${config.xdg.cacheHome}/dotnet";
    GDBHISTFILE = "${config.xdg.dataHome}/gdb/history";
    GOMODCACHE = "${config.xdg.cacheHome}/go/mod";
    GOPATH = "${config.xdg.dataHome}/go";
    GRADLE_USER_HOME = "${config.xdg.dataHome}/gradle";
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${config.xdg.configHome}/java";
    LESSHISTFILE = "-";
    LESSSECURE = 1; # makes less more secure
    MAVEN_OPTS = "-Dmaven.repo.local=${config.xdg.dataHome}/maven/repository";
    MIX_XDG = "true";
    NUGET_PACKAGES = "${config.xdg.configHome}/nuget";
    PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/python";
    PYTHONUSERBASE = "${config.xdg.dataHome}/python";
    SOLARGRAPH_CACHE = "${config.xdg.cacheHome}/solargraph";
    W3M_DIR = "${config.xdg.stateHome}/w3m";
    # God I hate npm
    # https://github.com/npm/cli/issues/654
    # https://github.com/npm/rfcs/issues/389
    npm_config_userconfig = "${config.xdg.configHome}/npm/config";
    npm_config_cache = "${config.xdg.cacheHome}/npm";
    npm_config_prefix = "${config.xdg.dataHome}/npm";
  };
  fonts.fontconfig.enable = true;
  xdg = {
    enable = true;
  };
  # IDK why this is useful and it takes a while to run during builds so I disable it
  programs.man.generateCaches = false;
  # I'll find the commands myself, thanks (also it takes a while to find the command)
  programs.command-not-found.enable = false;
}
