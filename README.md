# pysqm-cdf
Dockerfile and configuration for the [PySQM](https://guaix.fis.ucm.es/PySQM) software to manage the SQM device.

## Usage
### Build
Build with:
```bash
buildah bud -t pysqm .
```

### Run
Assuming that the data directory is `/media/pysqm`, run with:
```bash
podman run -v /tmp/pippo:/media/allsky/sqm:Z pysqm
```

This code should be run with e.g. a systemd unit.

## Todo
Write a systemd unit.
