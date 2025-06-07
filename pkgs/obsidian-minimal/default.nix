{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "obsidian-minimal";
  version = "8.0.0";

  src = fetchFromGitHub {
    owner = "kepano";
    repo = "obsidian-minimal";
    rev = version;
    sha256 = "1x7whw27abqx83hc2dn1kphc7r76vbn7hrn4i0f41vrjsc6jjfn3";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp $src/theme.css $out/
    cp $src/manifest.json $out/
    ln -s $out/theme.css $out/obsidian.css
  '';

  meta = with lib; {
    description = "Minimal theme for Obsidian";
    homepage = "https://github.com/kepano/obsidian-minimal";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
