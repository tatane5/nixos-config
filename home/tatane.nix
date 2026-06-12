{ pkgs, config, username, ... }:

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
    # Fonts
      jetbrains-mono

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
  

  # Desktop background
      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/tatane/.wallpaper2.png";
        picture-uri-dark = "file:///home/tatane/.wallpaper2.png";
      };

}
