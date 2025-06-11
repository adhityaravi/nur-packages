{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  pname = "obsidian-git";
  version = "2.33.0";

  mainJs = fetchurl {
    url = "https://github.com/Vinzent03/obsidian-git/releases/download/${version}/main.js";
    sha256 = "sha256-bTgfpbPs5TgQAjVGcGa8kbJJzGz3HqWVf7HVyUh8qOw=";
  };

  manifest = fetchurl {
    url = "https://github.com/Vinzent03/obsidian-git/releases/download/${version}/manifest.json";
    sha256 = "sha256-vn9FG27mlZ7SDjaaCHWJBpkCoab4vW9M2f/L+zfdqE8=";
  };

  styles = fetchurl {
    url = "https://github.com/Vinzent03/obsidian-git/releases/download/${version}/styles.css";
    sha256 = "sha256-n/IoUqqBEqMCRsFtsh7pgQL5EsdWp+sdLbLqHEJvmbY=";
  };

  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $styles $out/styles.css
  '';

  meta = with lib; {
    description = "Git integration plugin for Obsidian";
    homepage = "https://github.com/Vinzent03/obsidian-git";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
