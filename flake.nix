{
  description = "Tatane NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
     catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { nixpkgs, home-manager, catppuccin, ... }:
  let
    system = "x86_64-linux";

    mkHost = hostModule: users:
      nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          hostModule

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users = users;
          }
        ];
      };
  in
  {
    nixosConfigurations = {

      ghost = mkHost
        ./hosts/ghost/configuration.nix
        {
          tatane = import ./home/tatane.nix;
        };

      laptop = mkHost
        ./hosts/laptop/configuration.nix
        {
          elodie = import ./home/elodie.nix;
        };

    };
  };
}
