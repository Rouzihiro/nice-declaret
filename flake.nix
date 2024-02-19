{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    #nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    #nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

    home-manager = {
    	url = "github:nix-community/home-manager";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
    	url = "github:nix-community/nixvim/nixos-23.05";
     	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
  	nixpkgs,
	home-manager,
	nixvim,
	...
  } @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        system = "x86_64-linux";
        modules = [
          ./hosts/laptop
          home-manager.nixosModules.home-manager
          nixvim.nixosModules.nixvim
          {
            home-manager = {
		    useGlobalPkgs = true;
		    useUserPackages = true;
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
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
  };
}

