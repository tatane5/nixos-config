{
  description = "Configuration for NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    mkHost = {
      user,
      userModule,
      hardwareModule,
      homeModule,
      hostname,
      keyboardLayout,
      keyboardVariant,
      extraModules ? [],
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
        
        hardwareModule
        ./hosts/configuration.nix
          
          userModule
          {

        services.xserver.xkb = {
          layout = keyboardLayout;
          variant = keyboardVariant;
          options = "grp:alt_shift_toggle";

          };
          }

          home-manager.nixosModules.home-manager

          {
            networking.hostName = hostname;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.${user} = import homeModule;
          }
        ] ++ extraModules;
      };
  in {
    nixosConfigurations = {

      thost = mkHost {
        hardwareModule = ./hosts/desktop/hardware-configuration.nix;
        user = "tatane";
        userModule = ./modules/users/tatane.nix;
        homeModule = ./home/tatane.nix;
        hostname = "thost";
        keyboardLayout = "fr,fr";
        keyboardVariant = "bepo_afnor,";
        extraModules = [
          ./modules/gaming/steam.nix
          ];
      };

      laptop = mkHost {
        hardwareModule = ./hosts/laptop/hardware-configuration.nix;
        user = "elodie";
        userModule = ./modules/users/elodie.nix;
        homeModule = ./home/elodie.nix;
        hostname = "laptop";
        keyboardLayout = "fr";
        keyboardVariant = "";
      };

    };
  };
}
