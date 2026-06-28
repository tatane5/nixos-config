{ pkgs, config, ... }:

{
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;
  services.gvfs.enable = true;


  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-maps
    gnome-music
    gnome-terminal
    gnome-weather
    seahorse
    showtime
  ];
    # GNOME-specific system packages
   environment.systemPackages = with pkgs; [
    # GNOME utilities
     gnome-tweaks
     gnomeExtensions.user-themes
     gnomeExtensions.dash-to-dock
     # Theme
     paper-icon-theme
     (marble-shell-theme.override {
      colors = ["gray"];
      additionalInstallationTweaks = [ "-O" ];
    })
    catppuccin-gtk
    ];
}
