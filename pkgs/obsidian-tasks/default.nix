{ lib, stdenv, fetchzip }:

stdenv.mkDerivation rec {
  pname = "obsidian-tasks";
  version = "7.19.1";

  src = fetchzip {
    url = "https://github.com/obsidian-tasks-group/obsidian-tasks/releases/download/${version}/obsidian-tasks-${version}.zip";
    sha256 = "04kkwwgphm8ggabbir9ksn1qqz1qm4jvlcq9q5p06d364j3bnnbf";
    stripRoot = false;
  };

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p $out
    cp -r ./* $out/
  '';

  meta = with lib; {
    description = "Task management plugin for Obsidian";
    homepage = "https://github.com/obsidian-tasks-group/obsidian-tasks";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
