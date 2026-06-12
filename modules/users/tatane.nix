{
  users.users.tatane = {
    isNormalUser = true;
    description = "Tatane";

    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.fish;
  };
}
