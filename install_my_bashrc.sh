#!/bin/bash

my_dir=$(dirname "${0}")

if [ -e "${HOME}/.bashrc" ]; then
    mv "${HOME}/.bashrc" "${HOME}/.bashrc.bak"
fi
cp "${my_dir}/bash_rc" "${HOME}/.bashrc" -rfp
cp "${my_dir}/bashrc.d" "${HOME}/.bashrc.d" -rfp
