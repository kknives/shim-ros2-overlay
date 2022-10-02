{
  description = "ROS shim overlay for the Nix package manager";

  inputs = {
    nixpkgs.url = "github:lopsided98/nixpkgs/nix-ros";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    with nixpkgs.lib;
    with flake-utils.lib;
    eachSystem allSystems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
      in { legacyPackages = pkgs.rosPackages; }) // {
        overlays.default = import ./default.nix;

        overlay = nixpkgs.lib.warn
          "'nix-ros-overlay.overlay' is deprecated, use 'nix-ros-overlay.overlays.default' instead"
          self.overlays.default;
        nixosModule = nixpkgs.lib.warn
          "'nix-ros-overlay.nixosModule' is deprecated, use 'nix-ros-overlay.nixosModules.default' instead"
          self.nixosModules.default;
      };
}
