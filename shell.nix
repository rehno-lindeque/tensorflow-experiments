{ nixpkgs ? import <nixpkgs> {}, compiler ? "default" }:

let

  inherit (nixpkgs) pkgs;

  f = { mkDerivation, base, stdenv, tensorflow }:
      mkDerivation {
        pname = "tensorflow-experiment";
        version = "0.1.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = [ base tensorflow ];
        license = stdenv.lib.licenses.bsd3;
      };

  haskellOverrides =
    {
      overrides = self: super:
        let
          tensorflowSrc = pkgs.fetchFromGitHub
            {
              owner = "tensorflow";
              repo = "haskell";
              sha256 = "0xszbh09z03dpqycz5jx4751pzakc0f5x2n7y7m0n87nl1iwi33m";
              rev = "cdd4a0a74791e68550cb3697c3ff8a80aa9a26a5";
            };
          unpackSrcSubdir = superPkg: pkgs.haskell.lib.overrideCabal superPkg (drv: drv //
            { src = tensorflowSrc;
              preUnpack = "sourceRoot=haskell-${tensorflowSrc.rev}-src/${superPkg.pname}";
            });
          tensorflow_c = pkgs.pythonPackages.tensorflow;
        in
          {
            google-shim = unpackSrcSubdir (super.callPackage ./google-shim.nix {});
            tensorflow = unpackSrcSubdir (super.callPackage ./tensorflow.nix { inherit tensorflow_c; });
            tensorflow-core-ops = unpackSrcSubdir (super.callPackage ./tensorflow-core-ops.nix {});
            tensorflow-mnist-input-data = unpackSrcSubdir (super.callPackage ./tensorflow-mnist-input-data.nix {});
            tensorflow-mnist = unpackSrcSubdir (super.callPackage ./tensorflow-mnist.nix {});
            tensorflow-opgen = unpackSrcSubdir (super.callPackage ./tensorflow-opgen.nix {});
            tensorflow-ops = unpackSrcSubdir (super.callPackage ./tensorflow-ops.nix {});
            tensorflow-proto = unpackSrcSubdir (super.callPackage ./tensorflow-proto.nix {});
            tensorflow-queue = unpackSrcSubdir (super.callPackage ./tensorflow-queue.nix {});
          };
    };


  haskellPackages =
    (
      if compiler == "default"
      then pkgs.haskellPackages
      else pkgs.haskell.packages.${compiler}
    ).override haskellOverrides;

  drv = haskellPackages.callPackage f {};

in

  if pkgs.lib.inNixShell then drv.env else drv
