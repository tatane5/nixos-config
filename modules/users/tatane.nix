{pkgs, config, ... }:
{

  users.users.tatane = {
    isNormalUser = true;
    description = "Tatane";
    shell = pkgs.fish;

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };


}
