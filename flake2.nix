{
  description = "Flake of Rey";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umu.url = "github:Open-Wine-Components/umu-launcher?dir=packaging/nix";

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yt-x.url = "github:Benexl/yt-x";

    fzf-preview.url = "github:niksingh710/fzf-preview";
    fzf-preview.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  }: let
    # Import settings
    mySettings = import ./hosts/opts.nix { inherit pkgs; };

    # Apply patches to nixpkgs (optional, but useful)
    nixpkgs-patched = (import nixpkgs { system = mySettings.system.system; }).applyPatches {
      name = "nixpkgs-patched";
      src = nixpkgs;
    };

    # Import pkgs using the patched nixpkgs
    pkgs = import nixpkgs-patched {
      system = mySettings.system.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };

    # Import stable pkgs
    pkgs-stable = import nixpkgs-stable {
      system = mySettings.system.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };

    # List of supported architectures
    supportedSystems = ["aarch64-linux" "i686-linux" "x86_64-linux"];

    # Function to generate a set for each supported system
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    # Attribute set of nixpkgs for each system
    nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });

    # Nixpkgs lib
    lib = nixpkgs.lib;
  in {
    # ========================= SYSTEM CONFIGURATION
    nixosConfigurations = {
      ${mySettings.system.hostname} = lib.nixosSystem {
        system = mySettings.system.system;
        modules = [
          ./hosts/${mySettings.system.host}/conf.nix
        ]; # Load `conf.nix` from selected profile
        specialArgs = {
          inherit pkgs-stable;
          inherit mySettings;
          inherit inputs;
        };
      };
    };

    # ========================= USER CONFIGURATION
    homeConfigurations = {
      ${mySettings.user.name} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./hosts/${mySettings.system.host}/user.nix # Load `user.nix` from selected profile
        ];
        extraSpecialArgs = {
          inherit pkgs-stable;
          inherit mySettings;
          inherit inputs;
        };
      };
    };

    # ========================= PACKAGES & APPS
    packages = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
    in {
      default = self.packages.${system}.install;

      install = pkgs.writeShellApplication {
        name = "install";
        runtimeInputs = with pkgs; [git]; # Add more dependencies if needed
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