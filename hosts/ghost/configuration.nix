{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/desktop/gnome.nix
    ../../modules/audio/pipewire.nix
    ../../modules/fish.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "ghost";
  networking.networkmanager.enable = true;

  services.printing.enable = true;

  nixpkgs.config.allowUnfree = true;


  system.stateVersion = "26.05";

#time zone / keymap
  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "fr";
    variant = "bepo_afnor";
  };

  console.keyMap = "fr";

# Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;

    pulse.enable = true;
  };
# Allias Shell
  environment.shellAliases = {
    nixupgrade = "sudo nixos-rebuild switch --upgrade --flake ~/nixos-config#ghost";
  
  };
}
