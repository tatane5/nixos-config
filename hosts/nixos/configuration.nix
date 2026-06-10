{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/locale/fr.nix
    ../../modules/desktop/gnome.nix
    ../../modules/audio/pipewire.nix
    ../../modules/gaming/steam.nix
    ../../modules/users/tatane.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    obsidian
    libreoffice
    vscode
    qgis
    vivaldi
    keepassxc
    vlc
    git
  ];

  system.stateVersion = "26.05";
}
