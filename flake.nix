{
  description = "Flake of Ravy";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
   };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
    nixneovimplugins.url = "github:NixNeovim/NixNeovimPlugins";
    rust-overlay.url = "github:oxalica/rust-overlay";
    stylix.url = "github:danth/stylix";
    # Neve.url = "github:0xravy/Neve";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    stylix,
    nixvim,
    flake-utils,
    nixneovimplugins,
    rust-overlay,
    ...
  }: let
    #--------------------------
    mySettings = import ./profiles/personal/settings.nix {inherit pkgs;};

    nixpkgs-patched = (import nixpkgs {system = mySettings.system.system;}).applyPatches {
      name = "nixpkgs-patched";
      src = nixpkgs;
    };

    pkgs = import nixpkgs-patched {
      system = mySettings.system.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
      overlays = [rust-overlay.overlays.default];
    };

    pkgs-stable = import nixpkgs-stable {
      system = mySettings.system.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };

    # Systems that can run tests:
    supportedSystems = ["aarch64-linux" "i686-linux" "x86_64-linux"];

    # Function to generate a set based on supported systems:
    forAllSystems = inputs.nixpkgs.lib.genAttrs supportedSystems;

    # Attribute set of nixpkgs for each system:
    nixpkgsFor = forAllSystems (system: import inputs.nixpkgs {inherit system;});

    # configure lib
    lib = nixpkgs.lib;
    #--------------------------
  in {
    # ========================= SYSTEM
    nixosConfigurations = {
      ${mySettings.system.hostname} = lib.nixosSystem {
        system = mySettings.system.system;
        modules = [
          (./.
            + "/profiles"
            + ("/" + mySettings.system.profile)
            + "/configuration.nix")

          nixvim.nixosModules.nixvim
        ]; # load configuration.nix from selected PROFILE
        specialArgs = {
          # pass config variables from above
          inherit pkgs-stable;
          inherit mySettings;
          inherit inputs;
          inherit (inputs) stylix;
        };
      };
    };

    # ========================= USER
    homeConfigurations = {
      ${mySettings.user.username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          (./.
            + "/profiles"
            + ("/" + mySettings.system.profile)
            + "/home.nix") # load home.nix from selected PROFILE
        ];
        extraSpecialArgs = {
          inherit pkgs-stable;
          inherit mySettings;
          inherit inputs;
          inherit (inputs) stylix;
        };
      };
    };

    packages = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
    in {
      default = self.packages.${system}.install;

      install = pkgs.writeShellApplication {
        name = "install";
        runtimeInputs = with pkgs; [git]; # I could make this fancier by adding other deps
      };
    });

    apps = forAllSystems (system: {
      default = self.apps.${system}.install;

      install = {
        type = "app";
        program = "${self.packages.${system}.install}/bin/install";
      };
    });
  };
}
