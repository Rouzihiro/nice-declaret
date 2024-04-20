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
    Neve.url = "github:0xravy/Neve";
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
    mySettings = {
      # ---- SYSTEM SETTINGS ---- #
      system = {
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
      user = rec {
        username = "ravy"; # username
        name = "Ravy";
        github = {
          name = "0xravy";
          email = "0xravy@gmail.com"; # email (used for certain configurations)
        };
        keyboard = {
          layout = "us, ara";
          options = "grp:rctrl_rshift_toggle, caps:escape";
        };
        dotfilesDir = "~/.dotnix"; # absolute path of the local repo
        theme = "gruvbox-dark-hard"; # selcted theme from my themes directory (./themes/)
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
        fontPkg = pkgs.intel-one-mono; # Font package
        editor = "nvim"; # Default editor;
        spawnEditor = "nvim";
      };
    };

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
