version=v1
acrname=aleacr

az acr build -t servercoredonet5sdk:$version -r $acrname -f BatchDockerfile --platform windows .
