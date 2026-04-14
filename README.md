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

docker run --rm -it \
  --entrypoint /bin/bash \
  ghcr.io/viralpatel9/nrf-docker-prebuilt:v0.0.0 \
  -c "ls -la /opt/ncs"

# This command works for skipping JLink prompt
docker run --rm -v $(pwd)/hello_world:/workspace/hello_world   -w /opt/ncs/   --entrypoint /bin/bash   ghcr.io/viralpatel9/nrf-docker-prebuilt:v0.0.0   -c "west build -b nrf52840dk/nrf52840 /workspace/hello_world --pristine"
```