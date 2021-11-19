{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "emacs-i3";
  version = "0.1.1";

  src = fetchFromGitHub {
    owner = "c0deaddict";
    repo = pname;
    rev = version;
    sha256 = "sha256-64a6mZF4p3UPd9ih/CU9LdLJ7b1AX3zcpN/hC/TQVFw=";
  };

  cargoSha256 = "sha256-JD5akkaYjtgEfAa0+EEgF3Xv3U7kenU2B9qSgk254qY=";

  meta = with lib; {
    description = "Emacs i3 unified window management";
    homepage = "https://github.com/c0deaddict/emacs-i3";
    license = licenses.mit;
    maintainers = [ maintainers.c0deaddict ];
  };
}
