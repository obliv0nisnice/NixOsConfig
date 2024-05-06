{
  description = "NixOS Flake";
  inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager/master";
        inputs.nixpkgs.follows = "nixpkgs";
      };
  };
  outputs = { self,
              nixpkgs,
              home-manager,
            }@inputs:
{
  nixosConfigurations."jakob" = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./configuration.nix
      home-manager.nixosModules.home-manager
    ];
  };
};
}
