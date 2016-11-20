{ mkDerivation, async, attoparsec, base, bytestring, c2hs
, containers, data-default, fgl, google-shim, HUnit, lens-family
, mainland-pretty, mtl, proto-lens, proto-lens-protoc, semigroups
, split, stdenv, temporary, tensorflow-proto, tensorflow_c
, test-framework, test-framework-hunit, test-framework-quickcheck2
, text, transformers, vector
}:
mkDerivation {
  pname = "tensorflow";
  version = "0.1.0.0";
  src = ./tensorflow;
  libraryHaskellDepends = [
    async attoparsec base bytestring containers data-default fgl
    lens-family mainland-pretty mtl proto-lens proto-lens-protoc
    semigroups split temporary tensorflow-proto text transformers
    vector
  ];
  librarySystemDepends = [ tensorflow_c ];
  libraryToolDepends = [ c2hs ];
  testHaskellDepends = [
    attoparsec base bytestring google-shim HUnit lens-family proto-lens
    tensorflow-proto test-framework test-framework-hunit
    test-framework-quickcheck2
  ];
  homepage = "https://github.com/tensorflow/haskell#readme";
  description = "TensorFlow bindings";
  license = stdenv.lib.licenses.asl20;
}
