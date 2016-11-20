{ mkDerivation, base, bytestring, containers, google-shim, HUnit
, lens-family, proto-lens, stdenv, tensorflow, tensorflow-core-ops
, tensorflow-ops, tensorflow-proto, test-framework
, test-framework-hunit, text, transformers, vector
}:
mkDerivation {
  pname = "tensorflow-queue";
  version = "0.1.0.0";
  src = ./tensorflow-queue;
  libraryHaskellDepends = [
    base bytestring containers lens-family proto-lens tensorflow
    tensorflow-core-ops tensorflow-proto text
  ];
  testHaskellDepends = [
    base bytestring google-shim HUnit lens-family proto-lens tensorflow
    tensorflow-ops test-framework test-framework-hunit transformers
    vector
  ];
  homepage = "https://github.com/tensorflow/haskell#readme";
  description = "Basic access to TensorFlow queues";
  license = stdenv.lib.licenses.asl20;
}
