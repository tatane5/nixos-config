{ config, pkgs, ... }:

{

programs.fish = {
  enable = true;

  shellAliases = {
    ll = "ls -lah";
  };
};
}