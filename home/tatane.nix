{ pkgs, config, ... }:

{
  home.username = "tatane";
  home.homeDirectory = "/home/tatane";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  programs.fastfetch.enable = true;
  
  

  programs.git = {
  enable = true;
  userName = "tatane5";
  userEmail = "tatane5@lavache.com";
  };
  
  home.packages = with pkgs; [
    # Development tools
      vscode

    # Fonts
      jetbrains-mono
      nerd-fonts.jetbrains-mono


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
  
 
  
  programs.kitty.enable = true;

dconf.settings = {
  "org/gnome/desktop/app-folders" = {
    folder-children = [
      "System"
      "Utilities"
      "YaST"
      "Pardus"
    ];
  };

  "org/gnome/desktop/app-folders/folders/Pardus" = {
    categories = [ "X-Pardus-Apps" ];
    name = "X-Pardus-Apps.directory";
    translate = true;
  };

  "org/gnome/desktop/app-folders/folders/System" = {
    apps = [
      "org.gnome.baobab.desktop"
      "org.gnome.DiskUtility.desktop"
      "org.gnome.Logs.desktop"
      "org.gnome.SystemMonitor.desktop"
      "org.gnome.tweaks.desktop"
    ];
    name = "X-GNOME-Shell-System.directory";
    translate = true;
  };

  "org/gnome/desktop/app-folders/folders/Utilities" = {
    apps = [
      "org.gnome.Decibels.desktop"
      "org.gnome.Connections.desktop"
      "org.gnome.Papers.desktop"
      "org.gnome.font-viewer.desktop"
      "org.gnome.Loupe.desktop"
    ];
    name = "X-GNOME-Shell-Utilities.directory";
    translate = true;
  };

  "org/gnome/desktop/interface" = {
    accent-color = "slate";
    color-scheme = "prefer-dark";
    cursor-theme = "Paper";
    font-hinting = "slight";
    gtk-theme = "Adwaita";
    icon-theme = "Paper";
    text-scaling-factor = 1.0;
  };

  "org/gnome/desktop/peripherals/keyboard" = {
    numlock-state = true;
  };

  "org/gnome/desktop/peripherals/mouse" = {
    left-handed = true;
  };

  "org/gnome/desktop/peripherals/touchpad" = {
    two-finger-scrolling-enabled = true;
  };

  "org/gnome/shell" = {
    disabled-extensions = [ ];

    enabled-extensions = [
      "dash-to-dock@micxgx.gmail.com"
      "user-theme@gnome-shell-extensions.gcampax.github.com"
    ];

    favorite-apps = [
      "vivaldi-stable.desktop"
      "org.gnome.Console.desktop"
      "org.gnome.Nautilus.desktop"
      "steam.desktop"
      "org.keepassxc.KeePassXC.desktop"
    ];

    welcome-dialog-last-shown-version = "50.1";
  };

  "org/gnome/shell/extensions/dash-to-dock" = {
    apply-custom-theme = false;
    autohide = true;
    background-color = "rgb(94,92,100)";
    background-opacity = 0.0;
    custom-background-color = true;
    custom-theme-shrink = true;
    dash-max-icon-size = 48;
    dock-position = "BOTTOM";
    extend-height = false;
    height-fraction = 0.9;
    intellihide-mode = "ALL_WINDOWS";
    multi-monitor = true;
    preferred-monitor = -2;
    preferred-monitor-by-connector = "DP-2";
    preview-size-scale = 0.0;
    require-pressure-to-show = false;
    running-indicator-style = "DEFAULT";
    show-apps-at-top = false;
    show-favorites = true;
    show-show-apps-button = true;
    show-trash = true;
    transparency-mode = "FIXED";
  };

  "org/gnome/shell/extensions/user-theme" = {
    name = "Marble-gray-dark";
  };

  "org/gnome/desktop/world-clocks" = {
    locations = [ ];
  };
};
}
  


