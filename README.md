# Building Windows containers with .Net Core Apps

## .Net Core SDK and Runtime versions

- .Net Core SDK and Runtimes at:
  - https://dotnet.microsoft.com/download/visual-studio-sdks
- In the Dockerfile, adjust the SDK and SHA version for the version of .Net core you wish to run

## Batch .Net Core App

### With SDK Only

- [Dockerfile](batchapp/Dockerfile)
- [Buidling with ACR](batchapp/buildbatchapp.sh)

### With SDK and Runtime (Publish and final image)

- [Dockerfile](batchapp/DockerfileFinal)
- [Buidling with ACR](batchapp/buildbatchappfinal.sh)


## Web/WebApi .Net Core App

### With SDK Only

- [Dockerfile](webapp/Dockerfile)
- [Buidling with ACR](webapp/buildbatchapp.sh)

### With SDK and Runtime (Publish and final image)
