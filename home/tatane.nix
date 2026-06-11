{ pkgs, ... }:

{
  home.username = "tatane";
  home.homeDirectory = "/home/tatane";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.fastfetch.enable = true;

  home.packages = with pkgs; [
    # Development tools
      git
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
      fastfetch
      neovim

  ];

  xdg.configFile."fastfetch/config.jsonc".source =
    ../config/fastfetch.jsonc;
  
  home-manager.users.tatane = {
  programs.fish.enable = true;
};
   programs.kitty.enable = true;

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";

    kitty.enable = true;
  };
}


