{ mkDerivation, base, bytestring, containers, filepath, lens-family
, mainland-pretty, optparse-applicative, proto-lens, semigroups
, stdenv, tensorflow-proto, text
}:
mkDerivation {
  pname = "tensorflow-opgen";
  version = "0.1.0.0";
  src = ./tensorflow-opgen;
  libraryHaskellDepends = [
    base bytestring containers filepath lens-family mainland-pretty
    optparse-applicative proto-lens semigroups tensorflow-proto text
  ];
  homepage = "https://github.com/tensorflow/haskell#readme";
  description = "Code generation for TensorFlow operations";
  license = stdenv.lib.licenses.asl20;
}
