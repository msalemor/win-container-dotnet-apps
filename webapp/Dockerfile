FROM mcr.microsoft.com/windows/servercore:ltsc2022

# Install .NET
ENV DOTNET_VERSION=5.0.0

# Download and install the SDK
RUN powershell -Command \
        $ErrorActionPreference = 'Stop'; \
        $ProgressPreference = 'SilentlyContinue'; \
        Invoke-WebRequest -OutFile dotnet.zip https://download.visualstudio.microsoft.com/download/pr/abbdf8c4-cf89-4d7c-972e-398aad2b56ac/b4c6204cc2c7e667e3fe72b6be090252/dotnet-sdk-6.0.100-rc.2.21505.57-win-x64.zip; \
        $dotnet_sha512 = '072f581b679a85c546c3ee198332f63a5867933b845dcf5ad1938b3abef169ca34e88755f44282c165cc5e3aba63bb75830a6557397b97ef33e38c478e016a25'; \
        if ((Get-FileHash dotnet.zip -Algorithm sha512).Hash -ne $dotnet_sha512) { \
            Write-Host 'CHECKSUM VERIFICATION FAILED!'; \
            exit 1; \
        }; \
        \
        Expand-Archive dotnet.zip -DestinationPath dotnet; \
        Remove-Item -Force dotnet.zip

ENV ASPNETCORE_URLS=http://+:80 \
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true \
    # Enable correct mode for dotnet watch (only mode supported in a container)
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    # Skip extraction of XML docs - generally not useful within an image/container - helps performance
    NUGET_XMLDOC_MODE=skip

EXPOSE 80

# Set the .Net Path to be able to run dotnet commands
RUN setx /M PATH "%PATH%;C:\dotnet"

WORKDIR /src

# Download the projec file
COPY ["wdocker.csproj", "."]

# Restore the dependencies
RUN dotnet restore "wdocker.csproj"

# Copy everything else
COPY . .

# Set the src
WORKDIR "/src/"

# Build the project
RUN dotnet build "wdocker.csproj" -c Release -o /app/build

EXPOSE 80
# Run the project
ENTRYPOINT ["dotnet", "/app/build/wdocker.dll"]
