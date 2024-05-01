{ config, pkgs, libs, ... }: {
  imports = [
    ../../modules/go
    ../../modules/git
    # ../../modules/rust
    # ../../modules/node
    ../../modules/nvim
    # ../../modules/clang
    ../../modules/wezterm
  ];

  home.username = "fm";
  home.homeDirectory = "/Users/fm";
  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
