#!/usr/bin/env bash
echo $GITHUB_WORKSPACE
grep -rnwiq --include=\*.csproj "<RestorePackagesWithLockFile>true</RestorePackagesWithLockFile>" "${GITHUB_WORKSPACE}" || { echo "Nenhum projeto (csproj) contém a propriedade RestorePackagesWithLockFile. Veirifique a documentacao online https://devblogs.microsoft.com/nuget/enable-repeatable-package-restores-using-a-lock-file/"; exit 1; }


echo Validacao de requisitos de projeto concluida!