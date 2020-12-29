{ lib, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  pname = "sql_exporter";
  version = "0.5";
  goPackagePath = "github.com/free/sql_exporter";

  src = fetchFromGitHub {
    owner = "free";
    repo = pname;
    rev = version;
    sha256 = "1c0r937j6zcflqjp4sdji9as7fr5xvl5ysqv4djlhbdpl3hi6kn5";
  };

  buildFlagsArray = [ "-ldflags=-s -w -X main.version=${version}" ];

  meta = with lib; {
    description = "Database agnostic SQL exporter for Prometheus";
    homepage = "https://github.com/free/sql_exporter";
    maintainers = [ maintainers.c0deaddict ];
    license = licenses.mit;
  };
}
