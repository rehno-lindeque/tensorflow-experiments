{ mkDerivation, base, proto-lens, proto-lens-protoc, stdenv }:
mkDerivation {
  pname = "tensorflow-proto";
  version = "0.1.0.0";
  src = ./tensorflow-proto;
  libraryHaskellDepends = [ base proto-lens proto-lens-protoc ];
  homepage = "https://github.com/tensorflow/haskell#readme";
  description = "TensorFlow protocol buffers";
  license = stdenv.lib.licenses.asl20;
}
