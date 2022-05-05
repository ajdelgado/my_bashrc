#!/bin/bash

my_dir=$(dirname "${0}")

if [ -e "${HOME}/.bashrc" ]; then
    mv "${HOME}/.bashrc" "${HOME}/.bashrc.bak"
fi
cd "${my_dir}" ||exit 1
cp bash_rc "${HOME}/.bashrc" -rfp
cp bashrc.d/* "${HOME}/.bashrc.d/" -rfp
