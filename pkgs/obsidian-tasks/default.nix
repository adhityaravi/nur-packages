{ lib, stdenv, fetchurl, unzip }:

stdenv.mkDerivation rec {
  pname = "obsidian-tasks";
  version = "7.19.1";

  src = fetchurl {
    url = "https://github.com/obsidian-tasks-group/obsidian-tasks/releases/download/${version}/obsidian-tasks-${version}.zip";
    sha256 = "sha256-6lJ3YxYwU6qYyUQH21kqKeAXRll2OmmkhH8t3dPJG8c=";
  };

  nativeBuildInputs = [ unzip ];
  dontUnpack = true;

  phases = [ "installPhase" ];
  installPhase = ''
    mkdir -p $out/tmp
    unzip -d $out/tmp $src
    topdir=$(ls -1 $out/tmp)
    cp -r $out/tmp/$topdir/* $out/
    rm -rf $out/tmp
  '';

  meta = with lib; {
    description = "Task management plugin for Obsidian";
    homepage = "https://github.com/obsidian-tasks-group/obsidian-tasks";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
