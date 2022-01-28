with import <nixpkgs> {};

let
  angularcli = nodePackages."@angular/cli".overrideAttrs (_: {
    NG_CLI_ANALYTICS = false;
  });
in
stdenv.mkDerivation {
    name = "magit-demo-web-project-setup";
    buildInputs = [
        nodejs-12_x
        angularcli # nodePackages.@angular/cli
        nodePackages.jsonlint
        nodePackages.tsun
        bashInteractive
        emacs
    ];
    shellHook = ''
        # run a fresh build to ensure node_modules is populated with all necessary dependencies
        # npm run build > /dev/null 2>&1 # too expensive, makes switching a pain
    '';
}
