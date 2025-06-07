{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "obsidian-everforest-enchanted";
  version = "3.12.2";

  src = fetchFromGitHub {
    owner = "FireIsGood";
    repo = "obsidian-everforest-enchanted";
    rev = version;
    sha256 = "1jbr4f5kz0iina00nkxlkn27i23hlv0bqmcbkaxnrh1rafi46hpq";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';

  meta = with lib; {
    description = "Everforest Enchanted theme for Obsidian";
    homepage = "https://github.com/FireIsGood/obsidian-everforest-enchanted";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
