{ lib, stdenv, matrix-synapse, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "matrix-synapse-contrib";
  version = matrix-synapse.version;

  src = fetchFromGitHub {
    owner = "matrix-org";
    repo = "synapse";
    rev = "v${version}";
    sha256 = {
      "1.52.0" = "sha256-TeyRmUZVfCZ05jP7/na9knpGU9bhkY3kmwfjM42Cqlc=";
    }.${version};
  };

  installPhase = ''
    cp -r contrib $out/
  '';
}
