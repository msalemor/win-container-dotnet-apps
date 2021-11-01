# These commands rely on Azure Container Registry for when Docker is not installed on the local machine

version=v1
acrname=aleacr

az acr build -t servercoredonet5sdk:$version -r $acrname -f DockerfileFinal --platform windows .
