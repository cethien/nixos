{
  description = "cethien's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = { self, nixpkgs, catppuccin }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in
  {

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      specialArgs = { 
        inherit system;
        inherit pkgs;
      };

      modules = [
        catppuccin.nixosModules.catppuccin
        ./modules
        ./nixos/configuration.nix
      ];
    };
  };
}
