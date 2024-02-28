{
  description = "ravy flakes!";

  inputs = {
    Neve.url = "github:0xravy/Neve";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
    nixneovimplugins.url = "github:NixNeovim/NixNeovimPlugins";

    #hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixvim,
    flake-utils,
    nixneovimplugins,
    ...
  } @ inputs: let
    lib = nixpkgs-unstable.lib;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          # configuration.nix file
          ./hosts/laptop

          # home-manager settings
          home-manager.nixosModules.home-manager
          nixvim.nixosModules.nixvim
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              # home-manager file
              users.ravy = import ./home;
              sharedModules = [
                inputs.nixvim.homeManagerModules.nixvim
              ];
              extraSpecialArgs = {inherit inputs;};
            };
          }
        ];
      };
    };

    #Starndard Formatting
    #formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
  };
}
