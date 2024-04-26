{ config, pkgs, lib, libs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Francesco La Camera";
    userEmail = "fm@lacamera.org";

    delta = {
      enable = true;
    };

    extraConfig = {
      # pull.rebase = true;
      init.defaultBranch = "main";
      github.user = "lacamera";
      push.autoSetupRemote = true;
      core.editor = "nvim";
      core.fileMode = false;
      core.ignorecase = false;
    };
  };
}
