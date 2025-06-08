{ lib, vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  pname = "kulala-nvim";
  version = "5.3.0";

  src = fetchFromGitHub {
    owner = "mistweaverco";
    repo = "kulala.nvim";
    rev = "v5.3.0";
    sha256 = "1qf48ldpkwvsi9q73wkkvvlbdswl69ysapch46bk1ifdpp82nspr";
  };

  doCheck = false;  # require test fails in cli for some reason

  postInstall = ''
    rm -rf $out/{.github,assets,tests,fmt,scripts,docs}
    rm -f $out/{.gitignore,.gitmodules,.luacheckrc,.editorconfig,.yamllint.yaml}
    rm -f $out/{README.md,NEWS.md,CONTRIBUTING.md,CODEOWNERS,CODE_OF_CONDUCT.md,LICENSE}
    rm -f $out/{logo.png,logo.svg,Makefile,stylua.toml}
  '';

  meta = with lib; {
    description = "Kulala: a library for building interactive CLI tools in Neovim";
    homepage = "https://github.com/mistweaverco/kulala.nvim";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
