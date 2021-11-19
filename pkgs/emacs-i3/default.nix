{ lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "emacs-i3";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "c0deaddict";
    repo = pname;
    rev = version;
    sha256 = "sha256-mc5fG94+L0WbgRsJJLHGq7S1203uW/QfLzxT86XL9xY=";
  };

  cargoSha256 = "sha256-5kXP5juyaCfHG5eDEdHWl2rNQ9m5zW9c3UseapkXJGg=";

  meta = with lib; {
    description = "Emacs i3 unified window management";
    homepage = "https://github.com/c0deaddict/emacs-i3";
    license = licenses.mit;
    maintainers = [ maintainers.c0deaddict ];
  };
}
