{ lib, stdenv, fetchFromGitHub, cmake, sfml, eigen, libGL, makeWrapper }:

stdenv.mkDerivation rec {
  name = "MarbleMarcher";
  version = "478afb8ea9c894d6d8b961583aa557e2f63d6198";

  src = fetchFromGitHub  {
    owner = "HackerPoet";
    repo = "MarbleMarcher";
    rev = version;
    hash = "sha256-mK8WKKfwzo/CUi+A4P8msBgAwoJ03HYMOpWT4CxP9s4=";
  };

  nativeBuildInputs = [ cmake ];
  buildInputs = [ sfml eigen libGL makeWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share
    cp MarbleMarcher $out/bin/
    cp -r ../assets $out/share/assets
    wrapProgram $out/bin/MarbleMarcher \
        --run 'cd "$(dirname "$0")/../share"'

    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/HackerPoet/MarbleMarcher";
    description = "Fractal Physics Game";
    maintainers = with maintainers; [ c0deaddict ];
    license = licenses.gpl2;
  };
}
