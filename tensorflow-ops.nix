{ mkDerivation, base, bytestring, containers, data-default, fgl
, google-shim, HUnit, lens-family, mtl, proto-lens, QuickCheck
, stdenv, temporary, tensorflow, tensorflow-core-ops
, tensorflow-proto, test-framework, test-framework-hunit
, test-framework-quickcheck2, text, transformers, vector
}:
mkDerivation {
  pname = "tensorflow-ops";
  version = "0.1.0.0";
  src = ./tensorflow-ops;
  libraryHaskellDepends = [
    base bytestring containers data-default fgl lens-family mtl
    proto-lens tensorflow tensorflow-core-ops tensorflow-proto text
  ];
  testHaskellDepends = [
    base bytestring google-shim HUnit lens-family proto-lens QuickCheck
    temporary tensorflow tensorflow-core-ops tensorflow-proto
    test-framework test-framework-hunit test-framework-quickcheck2
    transformers vector
  ];
  homepage = "https://github.com/tensorflow/haskell#readme";
  description = "Friendly layer around TensorFlow bindings";
  license = stdenv.lib.licenses.asl20;
}
