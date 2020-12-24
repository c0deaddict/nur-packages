{ stdenv, fetchurl, autoPatchelfHook, libGL, libGLU, alsaLib, makeWrapper }:

# TODO:
# mkdir -p ~/.etlegacy/etmain
# cp ${pkgs.enemyterritory}/etmain/pak*.pk3 ~/.etlegacy/etmain/

stdenv.mkDerivation rec {
  name = "etlegacy";
  version = "2.76";

  src = fetchurl {
    url = "https://www.etlegacy.com/download/file/122";
    sha256 = "097xazrmzd86a634cdw0ywgl7i3h1x8k6zqs823ccrgnqiyq9r4l";
  };

  buildInputs = [ stdenv.cc.cc.lib libGL libGLU alsaLib ];

  nativeBuildInputs = [ autoPatchelfHook makeWrapper ];

  unpackPhase = ''
    tar xzf $src
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -r etlegacy-v${version}-i386/* $out/bin/

    wrapProgram "$out/bin/etl" \
      --run "cd $out/bin" \
      --set LD_LIBRARY_PATH "${stdenv.lib.makeLibraryPath [ alsaLib ]}"

    wrapProgram "$out/bin/etlded" \
      --run "cd $out/bin"
  '';

  meta = with stdenv.lib; {
    homepage = "";
    description = "";
    platforms = platforms.linux;
    maintainers = with maintainers; [ c0deaddict ];
  };
}
