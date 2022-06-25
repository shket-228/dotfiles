#!/bin/bash

# Script for fixing downloaded plugins

# Cmp signature help:
CMP_SH_LUA="$HOME/.local/share/nvim/plugin/cmp-nvim-lsp-signature-help/lua/cmp_nvim_lsp_signature_help/init.lua"
if [[ -e $CMP_SH_LUA ]]; then
    sed -Ei 's/ (preselect)/ --\1/g' $CMP_SH_LUA 
fi

# Python vscode stubs:
VS_STUBS="$HOME/.vscode/extensions/ms-python.vscode-pylance-*/dist/bundled"
PYTHON3_LIB="lib/python3*/site-packages"
if [[ -e $VS_STUBS ]]; then
    for stubs in $VS_STUBS/stubs $VS_STUBS/native-stubs; do
        cp -ru $stubs/* $HOME/.local/$PYTHON3_LIB
    done
fi

while [[ $1 ]]; do
    case $1 in
        -v | --virtualenv)
            shift
            env_path="$1"
            for stubs in $VS_STUBS/stubs $VS_STUBS/native-stubs; do
                cp -ru $stubs/* $env_path/$PYTHON3_LIB
            done;;
        -h | --help | *)
            echo "Usage: ./config.sh [-v, --virtualenv | -h, --help]";;
    esac
    shift
done

