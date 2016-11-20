{ mkDerivation, base, stdenv, test-framework }:
mkDerivation {
  pname = "google-shim";
  version = "0.1.0.0";
  src = ./google-shim;
  libraryHaskellDepends = [ base test-framework ];
  homepage = "https://github.com/tensorflow/haskell#readme";
  description = "Adapters to externalize TensorFlow code";
  license = stdenv.lib.licenses.asl20;
}
