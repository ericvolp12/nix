{ pkgs ? import <nixpkgs> {} }:
{ ericvolp12-zsh-theme = import ./ericvolp12-zsh-theme { inherit (pkgs) stdenv; }; }
