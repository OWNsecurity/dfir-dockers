# Use a functional wine-dotnet image
FROM chambm/wine-dotnet:4.7-x64

# Update the base image
RUN apt-get update && apt-get --allow-unauthenticated -y upgrade && apt-get --allow-unauthenticated -y dist-upgrade

# Init wine
RUN winecfg

# Download EvtxExplorer.zip
ADD https://f001.backblazeb2.com/file/EricZimmermanTools/EvtxExplorer.zip /ZimmermanTools/
# Extract and delete archive
RUN unzip /ZimmermanTools/EvtxExplorer.zip -d /ZimmermanTools && rm /ZimmermanTools/EvtxExplorer.zip

# Shared dir
VOLUME /data
# Default working dir
WORKDIR /data

# Default entrypoint: EvtxECmd.exe
ENTRYPOINT ["/usr/bin/wine64", "/ZimmermanTools/EvtxExplorer/EvtxECmd.exe"]

# Default argument
CMD ["--help"]
