{
  description = "Flake of Ravy";

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nixvim,
    flake-utils,
    nixneovimplugins,
    rust-overlay,
    ...
  }: let
    # ---- SYSTEM SETTINGS ---- #
    systemSettings = {
      system = "x86_64-linux"; # system arch
      hostname = "nixos"; # hostname
      profile = "personal"; # select a profile defined from my profiles directory
      timezone = "Asia/Riyadh"; # select timezone
      locale = "en_US.UTF-8"; # select locale
      bootMode = "uefi"; # uefi or bios
      bootMountPath = "/boot"; # mount path for efi boot partition; only used for uefi boot mode
      grubDevice = ""; # device identifier for grub; only used for legacy (bios) boot mode
    };

    # ----- USER SETTINGS ----- #
    userSettings = rec {
      username = "ravy"; # username
      name = "Ravy";
      github = {
        name = "0xravy";
        email = "0xravy@gmail.com"; # email (used for certain configurations)
      };
      dotfilesDir = "~/.dotnix"; # absolute path of the local repo
      theme = "gruvbox"; # selcted theme from my themes directory (./themes/)
      wm = "hyprland"; # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
      # window manager type (hyprland or x11) translator
      wmType =
        if (wm == "hyprland")
        then "wayland"
        else "x11";
      browser = "firefox"; # Default browser; must select one from ./user/app/browser/
      defaultRoamDir = "personal"; # Default org roam directory relative to ~/Org
      term = "alacritty"; # Default terminal command;
      font = "Intel One Mono"; # Selected font
      #fontPkg = pkgs.intel-one-mono; # Font package
      editor = "nvim"; # Default editor;
      spawnEditor = "nvim";
    };

    # create patched nixpkgs
    nixpkgs-patched = (import nixpkgs {system = systemSettings.system;}).applyPatches {
      name = "nixpkgs-patched";
      src = nixpkgs;
    };

    # configure pkgs
    pkgs = import nixpkgs-patched {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
      overlays = [rust-overlay.overlays.default];
    };

    pkgs-stable = import nixpkgs-stable {
      system = systemSettings.system;
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
    nixpkgsFor =
      forAllSystems (system: import inputs.nixpkgs {inherit system;});

    # configure lib
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = systemSettings.system;
        modules = [
          (./.
            + "/profiles"
            + ("/" + systemSettings.profile)
            + "/configuration.nix")

          # home-manager settings
          home-manager.nixosModules.home-manager
          nixvim.nixosModules.nixvim
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              # home-manager file
              users.${userSettings.username} = import (./.
                + "/profiles"
                + ("/" + systemSettings.profile)
                + "/home.nix");

              sharedModules = [
                inputs.nixvim.homeManagerModules.nixvim
              ];
              extraSpecialArgs = {
                inherit pkgs;
                inherit pkgs-stable;
                inherit inputs;
                inherit systemSettings;
                inherit userSettings;
              };
            };
          }
        ]; # load configuration.nix from selected PROFILE
        specialArgs = {
          # pass config variables from above
          inherit pkgs-stable;
          inherit systemSettings;
          inherit userSettings;
          inherit inputs;
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

  inputs = {
    Neve.url = "github:0xravy/Neve";

    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-23.11";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
    nixneovimplugins.url = "github:NixNeovim/NixNeovimPlugins";

    rust-overlay.url = "github:oxalica/rust-overlay";
  };
}
