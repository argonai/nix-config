{
  # This is to override modules that are in upstream
  # If we do not specify the disabled modules here, and then we try to use our own
  # version of those modules, we'll run into conflict errors
  disabledModules = [ "services/swaync.nix" ];
}
