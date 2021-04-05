{ stdenv, lib, fetchurl }:

let

  channel = "master";
  version = "v1.2.0-rc.0.109.gd04a059f";

in stdenv.mkDerivation {
  name = "kubectl-crossplane";
  inherit version;

  src = fetchurl {
    url =
      "https://releases.crossplane.io/${channel}/${version}/bin/linux_amd64/crank";
    sha256 = "1f2ddc91b5cxyq366bpxdh6zsd1bqyb9ffvx97wfs16x6ldi2y57";
  };

  dontUnpack = true;
  sourceRoot = ".";
  installPhase = ''
    install -Dm 0555 $src $out/bin/kubectl-crossplane
  '';
}
