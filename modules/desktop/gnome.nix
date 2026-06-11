{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-maps
    gnome-music
    gnome-terminal
    gnome-weather
    seahorse
    showtime
  ];
}
