# We can ask for flake inputs here:
{ config, lib, pkgs, flu, system, configName, ... }: with lib; let
  cfg = config.example.placeholder;

in {
  imports = [
    ./placeholder2
  ];

  options.example.placeholder = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = mdDoc ''
        # Placeholder

        An example. Enable/disable option.
      '';
    };
  };

  config = mkIf cfg.enable {
    programs.zsh.shellInit = ''
      echo "hello from placeholder!"
    '';

    example.placeholder2.enable = true;
  };
}
