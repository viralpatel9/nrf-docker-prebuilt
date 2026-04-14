# nrf-docker-perbuilt
```sh
# Build the docker image
docker build -t ghcr.io/viralpatel9/ncs-prebuilt:v3.0.3 .

# Run the docker image
docker run -it --rm   -v $(pwd)/hello_world:/workspace/hello_world   -w /opt/ncs/   ghcr.io/viralpatel9/ncs-prebuilt:v3.0.3 bash

# Build the binary
west build \
  -b nrf52840dk/nrf52840 \
  /workspace/hello_world \
  --pristine



west build --build-dir build hello_world --pristine --board nrf52840dk/nrf52840 -- -DCONFIG_DEBUG_THREAD_INFO=y -DCONF_FILE="prj.conf"
```