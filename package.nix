{ lib
, pkgs
, buildPythonPackage
, fetchFromGitHub
, python
}:

buildPythonPackage rec {
  pname = "neotology";
  version = "git";

  src = fetchFromGitHub {
    owner = "ontolocy";
    repo = "neontology";
    rev = "4df6e747e3af231679f72c9207b75ee439cc6c79";
    sha256 = "sha256-yluKQwYqQNd40UYYXGHfRUj/h+ZL4H0l7dp2rm0bfxk=";
  };

  build-system = [ python.pkgs.setuptools ];
  pyproject = true;

  dependencies = with python.pkgs; [
    neo4j
    pydantic
    pandas
    numpy
    python-dotenv
  ];

  pythonImportsCheck = [
    "neontology"
  ];
}
