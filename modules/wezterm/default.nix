{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
  };

  xdg.configFile = {
    "wezterm/wezterm.lua".source = ./wezterm.lua;
  };
}
