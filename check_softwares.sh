#!/bin/bash

################################################ Funcao de checagem ################################################
check_installed() {
    command -v $1 >/dev/null 2>&1
}
check_version() {
    version=$(command -v $1 | xargs $1 --version | head -n 1)
    echo "$1 version: $version"
}
install_package() {
    read -p "Deseja instalar $1? (y/n): " response
    if [ "$response" == "y" ]; then
        sudo apt-get install $1   
    fi
}
################################################ Verificar a presença e versão do Node.js ################################################
if check_installed "node"; then
    check_version "node"
else
    install_package "node"
fi
################################################ Verificar a presença e versão do Python ################################################
if check_installed "python"; then
    check_version "python"
else
    install_package "python"
fi
################################################# Verificar a presença e versão do Java ################################################
if check_installed "java"; then
    check_version "java"
else
    install_package "default-jre"  
fi
################################################# Verificar a presença e versão do Git ################################################
if check_installed "git"; then
    check_version "git"
else
    install_package "git"
fi
################################################ Verificar a presença e versão do Angular ################################################
if check_installed "ng"; then
    check_version "ng"
else
    read -p "Angular não encontrado. Deseja instalar o Angular? (y/n): " response
    if [ "$response" == "y" ]; then
        npm install -g @angular/cli
    fi
fi