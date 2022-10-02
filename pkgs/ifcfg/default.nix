{ lib, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "ifcfg";
  version = "0.23";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-YktaxUFpPM0+LOzDSMDogVTe1Kqt0lTLIxIS36r9vQI=";
  };

  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/ftao/python-ifcfg";
    description = "Cross platform ifcfg";
    license = licenses.bsd3;
    maintainers = with maintainers; [ fridh ];
  };
}
