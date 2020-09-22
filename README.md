# pysqm-cdf
Dockerfile and configuration for the [PySQM](https://guaix.fis.ucm.es/PySQM) software to manage a [SQM-LE](http://unihedron.com/projects/sqm-le/) device.

## Usage
These examples assume a [CentOS](https://centos.org/) 8 OS with [Podman](https://podman.io/) and [Buildah](https://buildah.io/).

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
To run the container, it is best to generate and use a systemd unit:
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

#### Periodically upload with a systemd timer
Modify `upload-pysqm-images.service` by inserting the correct name of the container. Once done so, install
the systemd timer with:
```bash
cp upload-pysqm-images.* /etc/systemd/system
systemctl daemon-reload
systemctl --now enable upload-pysqm-images.timer
```
This will upload the SQM images once every 10 minutes.

