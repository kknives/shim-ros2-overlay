{
  description = "ROS shim overlay for the Nix package manager";

  inputs = { flake-utils.url = "github:numtide/flake-utils"; };

  outputs = { self, nixpkgs, flake-utils }:
    with nixpkgs.lib;
    with flake-utils.lib;
    eachSystem allSystems (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.default ];
        };
      in { legacyPackages = [ pkgs.python3Packages.ifcfg ]; }) // {
        overlays.default = import ./default.nix;

      };
}
