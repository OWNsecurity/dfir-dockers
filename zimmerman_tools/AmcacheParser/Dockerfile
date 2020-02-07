# Use a functional wine-dotnet image
FROM chambm/wine-dotnet:4.7-x64

# Update the base image
RUN apt-get update && apt-get --allow-unauthenticated -y upgrade && apt-get --allow-unauthenticated -y dist-upgrade

# Init wine
RUN winecfg

# Download AmcacheParser.zip
ADD https://f001.backblazeb2.com/file/EricZimmermanTools/AmcacheParser.zip /ZimmermanTools/
# Extract and delete archive
RUN unzip /ZimmermanTools/AmcacheParser.zip -d /ZimmermanTools && rm /ZimmermanTools/AmcacheParser.zip

# Shared dir
VOLUME /data
# Default working dir
WORKDIR /data

# Default entrypoint: AmcacheParser.exe
ENTRYPOINT ["/usr/bin/wine64", "/ZimmermanTools/AmcacheParser.exe"]

# Default argument
CMD ["--help"]
