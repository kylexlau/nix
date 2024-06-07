{
  description = "My Darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
  }: {
    formatter.x86_64-darwin = nixpkgs.legacyPackages.x86_64-darwin.alejandra;

    darwinConfigurations."pro" = nix-darwin.lib.darwinSystem {
      modules = [
        ./darwin

        # home manager
        home-manager.darwinModules.home-manager
        {
          users.users.kyle.home = "/Users/kyle";
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = inputs;
          home-manager.users.kyle = import ./home;
        }
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."pro".pkgs;
  };
}
