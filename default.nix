{ pkgs ? import <nixpkgs> {} }:
  pkgs.writeShellScriptBin "nixf"
    ''${pkgs.nixUnstable}/bin/nix --experimental-features "nix-command flakes" $@''

