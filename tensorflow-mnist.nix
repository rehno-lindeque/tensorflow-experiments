{ mkDerivation, base, binary, bytestring, containers, filepath
, google-shim, HUnit, lens-family, proto-lens, split, stdenv
, tensorflow, tensorflow-core-ops, tensorflow-mnist-input-data
, tensorflow-ops, tensorflow-proto, test-framework
, test-framework-hunit, text, transformers, vector, zlib
}:
mkDerivation {
  pname = "tensorflow-mnist";
  version = "0.1.0.0";
  src = ./tensorflow-mnist;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base binary bytestring containers filepath lens-family proto-lens
    split tensorflow tensorflow-core-ops tensorflow-proto text vector
    zlib
  ];
  executableHaskellDepends = [
    base bytestring filepath lens-family proto-lens tensorflow
    tensorflow-mnist-input-data tensorflow-ops tensorflow-proto text
    transformers vector
  ];
  testHaskellDepends = [
    base bytestring google-shim HUnit lens-family proto-lens tensorflow
    tensorflow-mnist-input-data tensorflow-ops tensorflow-proto
    test-framework test-framework-hunit text transformers vector
  ];
  homepage = "https://github.com/tensorflow/haskell#readme";
  description = "TensorFlow demo application for learning MNIST model";
  license = stdenv.lib.licenses.asl20;
}
