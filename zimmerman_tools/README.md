## Build

You can build each Dockerfile with the following command:  
`docker build -t NAME .`

## Use

Each container comes with:
 - a shared volume: `/data`
 - a working dir: `/data`
 - a default entrypoint: `wine64 exec_path`
 - a default cmd: `--help`

You can mount the /data when running the container:
 - `docker run [--rm] [-it] -v $PWD:/data NAME`

## Alias

You can also create an alias for each command. Example:  
`alias amcacheparser="docker run --rm -v $PWD:/data amcacheparser"`
