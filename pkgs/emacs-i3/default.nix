{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "emacs-i3";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "c0deaddict";
    repo = pname;
    rev = version;
    sha256 = "sha256-AfEP2QZfBug84qnLpVZTPsFedMdcgSt++KQSvpOhORc=";
  };

  cargoSha256 = "sha256-NR6JHpbPmRr6VbkiWd9DwaNMEjNAJ48qXTxOmJxQAyM=";

  meta = with lib; {
    description = "Emacs i3 unified window management";
    homepage = "https://github.com/c0deaddict/emacs-i3";
    license = licenses.mit;
    maintainers = [ maintainers.c0deaddict ];
  };
}
