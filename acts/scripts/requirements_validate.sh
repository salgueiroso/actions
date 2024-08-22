#!/usr/bin/env bash

printenv

grep -qrw --include="*.csproj" "RestorePackagesWithLockFile" "caminho/para/sua/pasta" || { echo "Nenhum arquivo contém a palavra especificada"; exit 1; }


echo Validado!