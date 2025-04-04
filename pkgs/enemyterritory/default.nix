{ lib, stdenv, fetchurl, unzip, buildFHSUserEnv, autoPatchelfHook }:

let

  env = buildFHSUserEnv {
    name = "etmain-env";
    targetPkgs = pkgs: with pkgs; [ bash ];
    runScript = "bash";
  };

in stdenv.mkDerivation rec {
  name = "et";
  version = "260b";

  src = fetchurl {
    url = "https://cdn.splashdamage.com/downloads/games/wet/et${version}.x86_full.zip";
    hash = "sha256-Ko/vjoVY7//K1li7mosS34dAQYs1FBQjUOujt2Qes+A=";
  };

  nativeBuildInputs = [ unzip autoPatchelfHook ];

  # https://github.com/NixOS/nixpkgs/issues/54647
  unpackEnv = buildFHSUserEnv {
    name = "${name}-unpackEnv";
    runScript = "./et${version}.x86_keygen_V03.run --tar xf -C archive";
  };

  unpackPhase = ''
    unzip $src
    installer=./et${version}.x86_keygen_V03.run
    $installer --tar xf
    rm $installer
  '';

  installPhase = ''
    mkdir $out
    cp -r {etmain,pb} $out/
  '';

  meta = with lib; {
    homepage =
      "https://www.splashdamage.com/games/wolfenstein-enemy-territory/";
    description = "Wolfenstein: Enemy Territory";
    maintainers = with maintainers; [ c0deaddict ];
  };
}
