{ config, pkgs, ... }:

{
  home = rec {
    username = "rahul";
    homeDirectory = "/home/${username}";

    stateVersion = "22.11";
  };

  programs.home-manager.enable = true;
}