#!/bin/sh

GREEN='\033[0;32m'
RED='\033[0;31m'
NO_COLOR='\033[0m'
OK="${GREEN}OK${NO_COLOR}"
ERR="${RED}Err${NO_COLOR}"

check_dependencies() {
	local required=("nvim" "node" "npm" "gcc")
	local missing_deps=()
	for dep in "${required[@]}"; do
        	if ! command -v "$dep" >/dev/null 2>&1; then
            		missing_deps+=("$dep")
        	fi
    	done
	if [ ${#missing_deps[@]} -eq 0 ]; then
        	echo -e "${OK}"
    	else
		echo -e "${ERR}"
		echo "Dependencies missing:"
        	for dep in "${missing_deps[@]}"; do
            		echo -e "\t- $dep"
        	done
        	exit 1
    	fi

}

echo -n "Checking dependencies... "
check_dependencies

echo -n "Installing plugins with Packer... "
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall' 2>/dev/null && \
echo -e "${OK}"

echo -n "Syncing plugins with Packer... "
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' 2>/dev/null && \
echo -e "${OK}"

echo -n "Updating treesitter... "
nvim --headless -c ':TSUpdate' -c 'qa' 2>/dev/null && \
echo -e "${OK}"

echo -n "Setting undo config... "
sed -i "s/nithe/$USER/g" ~/.config/nvim/lua/variables.lua && \
echo -e "${OK}"

echo
