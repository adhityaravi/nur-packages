{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "obsidian-minimal-settings";
  version = "8.1.1";

  src = {
    mainJs = fetchurl {
      url = "https://github.com/kepano/obsidian-minimal-settings/releases/download/${version}/main.js";
      sha256 = "sha256-oJL2Y0LrRt2T2W/9dcncXk85jYVHxB+lGzj57bWfTfY=";
    };

    manifest = fetchurl {
      url = "https://github.com/kepano/obsidian-minimal-settings/releases/download/${version}/manifest.json";
      sha256 = "sha256-SKls4ezs64L4J3UZeJodDVJstAlpRQVm3A87eUf5zoI=";
    };
  };

  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out
    cp ${src.mainJs} $out/main.js
    cp ${src.manifest} $out/manifest.json
  '';

  meta = with lib; {
    description = "Minimal Settings plugin for Obsidian";
    homepage = "https://github.com/kepano/obsidian-minimal-settings";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
