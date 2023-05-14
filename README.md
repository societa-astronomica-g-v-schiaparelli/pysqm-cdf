# pysqm-cdf
Dockerfile and configuration for the [PySQM](https://guaix.fis.ucm.es/PySQM) software to manage a [SQM-LE](http://unihedron.com/projects/sqm-le/) device.

## Usage
Install the latest version of [Docker Engine](https://docs.docker.com/engine/install/) for the wanted Linux distribution. Then, build it and run it
with `docker compose`:
```bash
docker compose up -d
```

## Upload images
Images are uploaded with the included PHP script, which can be run with
```bash
docker exec -it --user pysqm pysqm-cdf-pysqm-1 bash /home/pysqm/upload_sqm_images.sh
```

### Periodically upload with a systemd timer
Modify `upload-pysqm-images.service` by inserting the correct name of the container. Once done so, install
the systemd timer with:
```bash
cp upload-pysqm-images.* /etc/systemd/system
systemctl daemon-reload
systemctl --now enable upload-pysqm-images.timer
```
This will upload the SQM images once every 10 minutes.

