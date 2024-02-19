
{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		./../../system/hardware
		./../../system/wm/wayland.nix
		./../../system/wm/xorg.nix
	];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "nixos"; # Define your hostname.
	networking.networkmanager.enable = true;

	nixpkgs.config.allowUnfree = true;
	# nix.package = pkgs.nix;
	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];
		auto-optimise-store = true;
	};

	nix = {
		package = pkgs.nixFlakes;
		extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
			"experimental-features = nix-command flakes";
	};

	programs.zsh.enable = true;
	users.users.ravy = {
		shell = pkgs.zsh;
		home = "/home/ravy";
		initialPassword = "1235";
		description = "ravy man";
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager"];
	};


	time.timeZone = "Asia/Riyadh";
	i18n.defaultLocale = "en_US.UTF-8";


	services.openssh.enable = true;

        
	fonts.packages = with pkgs; [ nerdfonts ];

	environment.variables = {
		SUDO_EDITOR = "nvim";
		SYSTEMD_EDITOR = "nvim";
		EDITOR = "nvim";
		VISUAL = "nvim";
	};

	environment.systemPackages = with pkgs; [
		home-manager

		# browsers
		firefox
		brave

		# myApps
		neovim
		lf
		eza
		wget
		kitty
		alacritty
		git
		mpd
		mpv
		fuzzel
		tofi
		btop
		nitrogen
		zip
		unzip
		vscodium
		xfce.thunar


		# --- rust
		rustup
		pkg-config
		glib
		gobject-introspection
		gdk-pixbuf
		pango
		pangolin

		#--- bun
		bun
	];

	# ZRAM SWAP
	zramSwap = {
		enable = true;
		algorithm = "zstd";
		memoryPercent = 80;
	};

	system.stateVersion = "24.11";
}
