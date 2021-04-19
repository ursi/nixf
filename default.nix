{ pkgs ? import <nixpkgs> {} }:
  let
    inherit (pkgs) nixUnstable;

    nixf =
      pkgs.writeShellScript "nixf"
        ''${nixUnstable}/bin/nix --experimental-features "nix-command flakes" $@'';
  in
  pkgs.stdenv.mkDerivation
    { pname = "nixf";
      inherit (nixUnstable) version;
      phases = [ "installPhase" ];

      installPhase =
        ''
        mkdir -p $out/bin
        ln -s ${nixf} $out/bin/nixf
        '';
    }

