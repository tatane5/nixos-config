{ pkgs, config, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # GNOME-specific system packages
   environment.systemPackages = with pkgs; [
    # GNOME utilities
     gnome-tweaks
     gnomeExtensions.user-themes
     gnomeExtensions.dash-to-dock
    # Theme
     paper-icon-theme
    (marble-shell-theme.override {
      colors = ["yellow"];
      additionalInstallationTweaks = [ "-O" ];
    })
    catppuccin-gtk


  ];
  
   environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-maps
    gnome-music
    gnome-weather
    seahorse
    showtime
  ];

  # GNOME dconf settings
   # Wallpaper - copy from source
    home.file.".wallpaper.jpg" = {
      source = ./../../img/wallpaper2.png;
    };


}
