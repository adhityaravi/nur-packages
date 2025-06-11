{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "obsidian-drawio";
  version = "1.5.4";

  mainJs = fetchurl {
    url = "https://github.com/zapthedingbat/drawio-obsidian/releases/download/${version}/main.js";
    sha256 = "sha256-QEANtwb8PrbBZTzQ9uj6DhjHcO1JyL8VK21j5IzF5zo=";
  };

  manifest = fetchurl {
    url = "https://github.com/zapthedingbat/drawio-obsidian/releases/download/${version}/manifest.json";
    sha256 = "sha256-OTpqiJaxAz3QWa2o4yrosnGLki46tTlMkiwBC3TDqyU=";
  };

  styles = fetchurl {
    url = "https://github.com/zapthedingbat/drawio-obsidian/releases/download/${version}/styles.css";
    sha256 = "sha256-krjjIiCJt+PRXdEscZ0TLqgc7XiEo9L/FvclRdTHdxA=";
  };

  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $styles $out/styles.css
  '';

  meta = with lib; {
    description = "Integrates draw.io diagrams with Obsidian";
    homepage = "https://github.com/zapthedingbat/drawio-obsidian";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
