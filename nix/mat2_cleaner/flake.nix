{
  description = "MAT2 Cleaner Environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.mat2 pkgs.inotifyTools ];
          shellHook = ''
            echo "MAT2 Cleaner Shell"
            chmod +x ./watch_mat2.sh
            ./watch_mat2.sh
          '';
        };
      });
}
