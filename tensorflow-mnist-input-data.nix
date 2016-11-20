{ mkDerivation, base, bytestring, Cabal, cryptonite, directory
, filepath, HTTP, network-uri, stdenv
}:
mkDerivation {
  pname = "tensorflow-mnist-input-data";
  version = "0.1.0.0";
  src = ./tensorflow-mnist-input-data;
  libraryHaskellDepends = [
    base bytestring Cabal cryptonite directory filepath HTTP
    network-uri
  ];
  homepage = "https://github.com/tensorflow/haskell#readme";
  description = "Downloader of input data for training MNIST";
  license = stdenv.lib.licenses.asl20;
}
