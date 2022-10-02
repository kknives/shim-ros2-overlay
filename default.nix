{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  callPackage = pkgs.lib.callPackageWith (pkgs // self);
  self = rec {
    ifcfg = callPackage ./pkgs/ifcfg {
      inherit (pkgs.python3Packages) buildPythonPackage fetchPypi;
    };
  };
in self
