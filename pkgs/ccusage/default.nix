{ lib, stdenv, fetchurl, makeWrapper, nodejs }:

stdenv.mkDerivation rec {
  pname = "ccusage";
  version = "11.0.2";

  src = fetchurl {
    url = "https://registry.npmjs.org/${pname}/-/${pname}-${version}.tgz";
    sha256 = "sha256-DYWVVqp41qUKiDnZHB/u4EWe5UN3hDiA49p2ucFuZUo=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/lib/node_modules/${pname}
    tar -xzf $src --strip-components=1 -C $out/lib/node_modules/${pname}

    mkdir -p $out/bin
    makeWrapper ${nodejs}/bin/node $out/bin/${pname} \
      --add-flags "$out/lib/node_modules/${pname}/dist/index.js"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Usage analysis tool for Claude Code";
    homepage = "https://github.com/ryoppippi/ccusage";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
