{
  description = "endgame setup";

  inputs = {
    # nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    # home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hardware
    hardware.url = "github:nixos/nixos-hardware";

    # disko
    disko.url = "githu:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      uzawa = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./nixos/configuration.nix
          #disko.nixosModules.disko
          ./nixos/disko.nix
        ];
      };
    };
    homeConfigurations = {
      "reisa@uzawa" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacypackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home-manager/home.nix
          ];
      };
    };
  };
}
