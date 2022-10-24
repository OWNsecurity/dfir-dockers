# dfir-dockers

Repository to share common DFIR tools used in OWN-CERT during investigation in Docker format to be replicated every time on empty environement.

## Build all

On Linux, you can build all images located in zimmermantools directory by running ```build_all.sh```.

A Dockerfile's template which should build any zimmerman tool from it's repository. Run:

```shell
docker build --no-cache --build-arg TOOL=MFTECmd -t mftecmd:latest ./
```