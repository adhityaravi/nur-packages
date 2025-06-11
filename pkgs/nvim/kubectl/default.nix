{ lib, vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  pname = "kubectl-nvim";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "Ramilito";
    repo = "kubectl.nvim";
    rev = "v2.0.0";
    sha256 = "0qdkdj7p986lf6rycw9f1fkvi2391vpjxibmw21590pbry88d6y1";
  };

  doCheck = false;

  postInstall = ''
    rm -rf $out/{.github}
    rm -f $out/{README.md,LICENSE,Makefile,stylua.toml,vim.toml,.luacheckrc,.luarc.json,.releaserc.json}
  '';

  meta = with lib; {
    description = "Interact with Kubernetes clusters from Neovim";
    homepage = "https://github.com/Ramilito/kubectl.nvim";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
