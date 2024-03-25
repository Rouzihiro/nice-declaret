{
  description = "Flake of Ravy";

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nixvim,
    flake-utils,
    nixneovimplugins,
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
      browser = "qutebrowser"; # Default browser; must select one from ./user/app/browser/
      defaultRoamDir = "personal"; # Default org roam directory relative to ~/Org
      term = "alacritty"; # Default terminal command;
      font = "Intel One Mono"; # Selected font
      #fontPkg = pkgs.intel-one-mono; # Font package
      editor = "nvim"; # Default editor;
      spawnEditor = "nvim";
    };

    lib = nixpkgs-unstable.lib;
  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = systemSettings.system;

        specialArgs = {
          inherit inputs;
          inherit systemSettings;
          inherit userSettings;
        };

        modules = [
          # configuration.nix file
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
                inherit inputs;
                inherit systemSettings;
                inherit userSettings;
              };
            };
          }
        ];
      };
    };

    #Starndard Formatting
    #formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
  };

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
  };
}
