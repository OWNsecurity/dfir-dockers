FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine-amd64
RUN apk upgrade && apk add --update-cache wget unzip
RUN wget -O /tmp/SBECmd.zip https://f001.backblazeb2.com/file/EricZimmermanTools/net6/SBECmd.zip
RUN unzip /tmp/SBECmd -d /app
RUN apk del wget unzip
WORKDIR /app

ENTRYPOINT ["dotnet", "/app/SBECmd.dll"]
CMD ["--help"]
