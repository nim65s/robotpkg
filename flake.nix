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
          devShells = {
            default =
              with pkgs;
              mkShell {
                env = {
                  ROBOTPKG_BASE = "/home/nim/local/robotpkg/install";
                  #   UNAME = lib.getExe' coreutils "uname";
                  #   SH = lib.getExe' bash "sh";
                  #   CAT = lib.getExe' coreutils "cat";
                  #   SETENV = lib.getExe' coreutils "env";
                  #   EXPR = lib.getExe' coreutils "expr";
                  #   CMP = lib.getExe' diffutils "cmp";
                  #   LS = lib.getExe' coreutils "ls";
                  #   WC = lib.getExe' coreutils "wc";
                  #   TOUCH = lib.getExe' coreutils "touch";
                  #   CHOWN = lib.getExe' coreutils "chown";
                  #   CHMOD = lib.getExe' coreutils "chmod";
                  #   CP = lib.getExe' coreutils "cp";
                  #   LN = lib.getExe' coreutils "ln";
                  #   MV = lib.getExe' coreutils "mv";
                  #   RM = lib.getExe' coreutils "rm";
                  #   RMDIR = lib.getExe' coreutils "rmdir";
                  #   MKDIR = lib.getExe' coreutils "mkdir";
                  #   DATE = lib.getExe' coreutils "date";
                  #   ID = lib.getExe' coreutils "id";
                  #   GREP = lib.getExe' gnugrep "grep";
                  #   EGREP = lib.getExe' gnugrep "egrep";
                  #   FIND = lib.getExe' findutils "find";
                  #   SED = lib.getExe' gnused "sed";
                  #   SORT = lib.getExe' coreutils "sort";
                  #   TSORT = lib.getExe' coreutils "tsort";
                  #   AWK = lib.getExe' gawk "awk";
                  #   XARGS = lib.getExe' findutils "xargs";
                  #   TPUT = lib.getExe' ncurses "tput";
                  #   PAGER = lib.getExe' less "less";
                  #   PRINTF = lib.getExe' coreutils "printf";
                };
                packages = [
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
              };
            fhs =
              (pkgs.buildFHSEnv {
                name = "robotpkg-env";
                targetPkgs =
                  pkgs: with pkgs; [
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
          };
          packages = {
            python = pkgs.python3.withPackages (
              p: with p; [
                boost
                boost.dev
                scipy
              ]
            );
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
