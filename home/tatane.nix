{ pkgs, ... }:

{
  home.username = "tatane";
  home.homeDirectory = "/home/tatane";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.fastfetch.enable = true;
  programs.git.enable = true;

  home.packages = with pkgs; [
    # Development tools
      vscode

    # Multimedia / Graphism
      krita
      vlc

    # Office tools
      libreoffice
      obsidian
      qgis
      vivaldi

    # Security tools
      keepassxc
         
         
    # Shell tools
      neovim

  ];

  xdg.configFile."fastfetch/config.jsonc".source =
    ../config/fastfetch.jsonc;
  
  programs.fish.enable = true
  


