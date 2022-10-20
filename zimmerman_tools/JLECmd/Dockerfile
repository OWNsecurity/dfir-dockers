FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine-amd64 AS build

# Update the base image
RUN apk add --update-cache git
RUN git clone https://github.com/EricZimmerman/JLECmd.git /source
RUN apk del git
WORKDIR /source

RUN dotnet restore -r linux-musl-x64 /p:PublishReadyToRun=true

WORKDIR /source/JLECmd
RUN dotnet publish -c release -o /app -r linux-musl-x64 -f net6.0 --self-contained true --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine-amd64
RUN apk -U upgrade
WORKDIR /app
COPY --from=build /app ./

ENTRYPOINT ["dotnet", "/app/JLECmd.dll"]
CMD ["--help"]
