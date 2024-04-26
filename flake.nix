{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    nixpkgsUnstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # deploy-rs = {
    #   url = "github:serokell/deploy-rs";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # darwin = {
    #   url = "github:lnl7/nix-darwin/master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs @ { self, flake-utils, nixpkgs, nixpkgsUnstable, home-manager, sops-nix }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          devShells = {
            default = with pkgs; mkShell {
              buildInputs = [
                pkgs.home-manager
                pkgs.nixos-rebuild # needed for remote deploys on macOS
              ];
            };
          };
        })

    // 
    {
      homeConfigurations = {
        "fm@macbook" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages.aarch64-darwin;
          modules = [ ./machines/macbook ];
          extraSpecialArgs = { pkgsUnstable = inputs.nixpkgsUnstable.legacyPackages.aarch64-darwin; };
        };
      };

      # images = {
      #   # nix build .#images.homepi
      #   homepi = self.nixosConfigurations.homepi.config.system.build.sdImage;
      # };

      # deploy.nodes = {
      #   homepi = {
      #     # hostname = "192.168.1.8"; # local ip
      #     hostname = "homepi";
      #     profiles.system = {
      #       sshUser = "root";
      #       path = deploy-rs.lib.aarch64-linux.activate.nixos self.nixosConfigurations.homepi;
      #     };
      #   };
      # };

      # checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
