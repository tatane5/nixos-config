{ pkgs, ... }:

{
  home.username = "tatane";
  home.homeDirectory = "/home/tatane";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.fastfetch.enable = true;

  home.packages = with pkgs; [
    fastfetch
  ];

  xdg.configFile."fastfetch/config.jsonc".source =
    ../config/fastfetch.jsonc;
}
