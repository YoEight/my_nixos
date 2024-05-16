{
  description = "A Simple NixOS flake";
  
  inputs = {
    # NixOS official package source, using hte nixos-23.11 here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nixvim, ... }: {
    nixosConfigurations.haestrom = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      modules = [
      	# Import the previous configuration.nix we used,
	# so the old configuration file still takes effect.
	./configuration.nix

	home-manager.nixosModules.home-manager {
          home-manager.extraSpecialArgs = { inherit inputs system ; };
	  home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;

	  home-manager.users.yoeight = import ./home-manager;
	}
      ];
    };
  };
}
