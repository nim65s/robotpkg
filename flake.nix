{
  description = "compilation framework and packaging system for installing robotics software";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem =
        { pkgs, self', ... }:
        {
          devShells.default = (pkgs.buildFHSEnv {
            name = "robotpkg-env";
            targetPkgs = pkgs: with pkgs; [
              assimp.dev
              assimp.lib
              blas
              blas.dev
              cmake
              console-bridge
              bzip2.dev
              doxygen
              eigen
              file
              gcc
              ipopt
              lapack
              lapack.dev
              ncurses
              ncurses.dev
              octomap
              openssl
              openssl.bin
              openssl.dev
              pax
              pkg-config
              qhull
              swig
              tinyxml-2
              urdfdom
              urdfdom-headers
              zlib
              zlib.dev
              self'.packages.python
              self'.packages.rptest
              self'.packages.rprelease
            ];
          }).env;
          packages = {
            python = pkgs.python3.withPackages (p: with p; [
              boost
              boost.dev
              scipy
            ]);
            rprelease = pkgs.writeShellScriptBin "rprelease" ''
              set -euxo pipefail

              make clean
              make mdi
              make
              make install
              make print-PLIST
              sed -i '/robotpkg_info/d' PLIST.guess
              vimdiff PLIST.guess PLIST
              make install confirm
            '';
            rptest = pkgs.writeShellScriptBin "rptest" ''
              set -euxo pipefail

              build=$(make show-var VARNAME=CONFIGURE_DIRS)
              pushd $(make show-var VARNAME=WRKSRC)
              pushd $build
              make test
              popd
              popd
            '';
          };
        };
    };
}
