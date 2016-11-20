{ mkDerivation, base, bytestring, Cabal, filepath, lens-family
, mainland-pretty, proto-lens, stdenv, tensorflow, tensorflow-opgen
, text
}:
mkDerivation {
  pname = "tensorflow-core-ops";
  version = "0.1.0.0";
  src = ./tensorflow-core-ops;
  libraryHaskellDepends = [
    base bytestring Cabal filepath lens-family mainland-pretty
    proto-lens tensorflow tensorflow-opgen text
  ];
  homepage = "https://github.com/tensorflow/haskell#readme";
  description = "Haskell wrappers for Core Tensorflow Ops";
  license = stdenv.lib.licenses.asl20;
}
