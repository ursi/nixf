{ pkgs ? import <nixpkgs> {} }:
  let
    inherit (pkgs) nixUnstable;

    nixf =
      pkgs.writeShellScript "nixf"
        ''${nixUnstable}/bin/nix --experimental-features "nix-command flakes" "$@"'';

    completions =
      builtins.toString
        [ "build"
          "develop"
          "flake"
          "help"
          "profile"
          "repl"
          "run"
          "search"
          "shell"
          "bundle"
          "copy"
          "edit"
          "eval"
          "log"
          "path-info"
          "registry"
          "why-depends"
          "daemon"
          "describe-stores"
          "hash"
          "key"
          "nar"
          "print-dev-env"
          "realisation"
          "show-config"
          "show-derivation"
          "store"
          "doctor"
          "upgrade-nix"
        ];
  in
  pkgs.stdenv.mkDerivation
    { pname = "nixf";
      inherit (nixUnstable) version;
      phases = [ "installPhase" ];

      installPhase =
        ''
        mkdir -p $out/bin
        cd $out
        ln -s ${nixf} bin/nixf
        mkdir -p share/bash-completion/completions
        cd $_
        echo 'complete -W "${completions}" nixf' > nixf
        '';
    }

