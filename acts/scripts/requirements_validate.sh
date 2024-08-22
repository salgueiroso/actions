#!/usr/bin/env bash

# Este trecho verifica se a geração do arquivo packages.lock.json está habilitada em algum dos projetos.
# A finalidade deste requisito serve para que o dotnet possa fazer cache local dos pacotes nuget
grep -rnwiq --include=\*.csproj "<RestorePackagesWithLockFile>true</RestorePackagesWithLockFile>" "${GITHUB_WORKSPACE}" || { echo "Nenhum projeto (csproj) contém a propriedade RestorePackagesWithLockFile. Veirifique a documentacao online https://devblogs.microsoft.com/nuget/enable-repeatable-package-restores-using-a-lock-file/"; exit 1; }


echo Validacao de requisitos de projeto concluida!