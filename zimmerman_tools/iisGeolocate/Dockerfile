# Use a functional wine-dotnet image
FROM chambm/wine-dotnet:4.7-x64

# Update the base image
RUN apt-get update && apt-get --allow-unauthenticated -y upgrade && apt-get --allow-unauthenticated -y dist-upgrade

# Init wine
RUN winecfg

# Download iisGeolocate.zip
ADD https://f001.backblazeb2.com/file/EricZimmermanTools/iisGeolocate.zip /ZimmermanTools/
# Extract and delete archive
RUN unzip /ZimmermanTools/iisGeolocate.zip -d /ZimmermanTools && rm /ZimmermanTools/iisGeolocate.zip

# Shared dir
VOLUME /data
# Default working dir
WORKDIR /data

# Default entrypoint: iisGeolocate.exe
ENTRYPOINT ["/usr/bin/wine64", "/ZimmermanTools/iisGeolocate/iisGeolocate.exe"]

# Default argument
CMD ["--help"]
