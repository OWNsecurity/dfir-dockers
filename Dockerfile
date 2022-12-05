ARG TOOL="RECmd"

FROM mcr.microsoft.com/dotnet/sdk:6.0-alpine-amd64 AS build
ARG TOOL

# Update the base image
RUN apk add --update-cache git
RUN git clone https://github.com/EricZimmerman/$TOOL.git /source
RUN apk del git
WORKDIR /source

RUN dotnet restore -r linux-musl-x64 /p:PublishReadyToRun=true

WORKDIR /source/$TOOL
RUN dotnet publish -c release -o /app -r linux-musl-x64 -f net6.0 --self-contained true --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0-alpine-amd64
ARG TOOL
ENV TOOLNAME $TOOL
RUN apk -U upgrade
WORKDIR /app
COPY --from=build /app ./

ENTRYPOINT dotnet /app/$TOOLNAME.dll
CMD ["--help"]
