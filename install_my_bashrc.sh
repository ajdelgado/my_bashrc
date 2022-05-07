#!/bin/bash

my_dir=$(dirname "${0}")

if [ -n "${1}" ]; then
    install_directory="${1}"
    if [ ! -d "${install_directory}" ]; then
        echo "The given install directory '${install_directory}' does NOT exists."
        exit 2
    fi
    echo "Installing in '${install_directory}' folder instead of \$HOME"
else
    install_directory="${HOME}"
fi

if [ -e "${install_directory}/.bashrc" ]; then
    mv "${install_directory}/.bashrc" "${install_directory}/.bashrc.bak"
fi
cd "${my_dir}" ||exit 1
cp bash_rc "${install_directory}/.bashrc" -rfp
mkdir -p "${install_directory}/.bashrc.d/"
cp bashrc.d/* "${install_directory}/.bashrc.d/" -rfp
if [ -e "${my_dir}/sources}" ]; then
    mkdir -p "${install_directory}/src/"
    while read -r source
    do
        source_name=$(basename "${source}" .git)
        git clone "${source}" "${install_directory}/src/${source_name}" --depth 1
        if [ -e "${install_directory}/src/${source_name}/install.sh" ]; then
            bash "${install_directory}/src/${source_name}/install.sh"
        fi
    done <<< "$(sed 's/#.*$//g' "${my_dir}/sources")"
fi
