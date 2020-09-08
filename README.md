# pysqm-cdf
Dockerfile and configuration for the [PySQM](https://guaix.fis.ucm.es/PySQM) software to manage the SQM device.

## Usage
### Build
Build with:
```bash
buildah bud -t pysqm .
```

### Run container
Assuming that the data directory is `/media/pysqm`, run with:
```bash
podman run -d -v /media/pysqm:/media/pysqm pysqm
```

### Start and stop container
To run the container, it is best to build a systemd unit:
```bash
podman generate systemd <container_name> > /etc/systemd/system/pysqm.service
systemctl daemon-reload
systemctl enable pysqm.service
```

### Upload images
Images are uploaded with the included PHP script, which can be run with
```bash
podman exec -it --user pysqm <container_name> php /home/pysqm/upload_sqm_images.php
```

This can be automatized with a systemd timer

