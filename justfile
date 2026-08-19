mod skills

[private]
default:
    @just --list

init-submodules:
    git submodule update --init --recursive
