{
  lib,
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation rec {
  pname = "obsidian-dataview";
  version = "0.5.70";

  mainJs = fetchurl {
    url = "https://github.com/blacksmithgu/obsidian-dataview/releases/download/${version}/main.js";
    sha256 = "sha256-a7HPcBCvrYMOc1dfyg4r+9MnnFYuPZ0k8tL0UWHrfQA=";
  };

  manifest = fetchurl {
    url = "https://github.com/blacksmithgu/obsidian-dataview/releases/download/${version}/manifest.json";
    sha256 = "sha256-kjXbRxEtqBuFWRx57LmuJXTl5yIHBW6XZHL5BhYoYYU=";
  };

  styles = fetchurl {
    url = "https://github.com/blacksmithgu/obsidian-dataview/releases/download/${version}/styles.css";
    sha256 = "sha256-MwbdkDLgD5ibpyM6N/0lW8TT9DQM7mYXYulS8/aqHek=";
  };

  phases = ["installPhase"];
  installPhase = ''
    mkdir -p $out
    cp $mainJs $out/main.js
    cp $manifest $out/manifest.json
    cp $styles $out/styles.css
  '';

  meta = with lib; {
    description = "Dataview plugin for Obsidian";
    homepage = "https://github.com/blacksmithgu/obsidian-dataview";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
