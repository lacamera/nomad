{ config, pkgs, libs, ... }: {
  imports = [
    ../../modules/gh
    ../../modules/nvim
    ../../modules/wezterm
  ];

  home.username = "fm";
  home.homeDirectory = "/Users/fm";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
