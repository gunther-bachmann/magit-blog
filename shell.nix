with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "magit-demo-web-project-setup";
    buildInputs = [
        nodejs
        nodePackages.npm
        nodePackages.jsonlint
        bashInteractive
        emacs
    ];
    shellHook = ''
        # make sure no output is done, since direnv fails with direnv: error unmarshal() base64 decoding: illegal base64 data at input byte ?
        npm install @angular/cli > /dev/null 2>&1
        npm install tsun > /dev/null 2>&1
        # put all linked executables in node_modules on the path
        export PATH=`pwd`/node_modules/.bin:$PATH
        # run a fresh build to ensure node_modules is populated with all necessary dependencies
        # npm run build > /dev/null 2>&1 # too expensive, makes switching a pain
    '';
}
