{pkgs, config, ... }:
{

  users.users.elodie = {
    isNormalUser = true;
    description = "Élodie";
    shell = pkgs.fish;

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };


}