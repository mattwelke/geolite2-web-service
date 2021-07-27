# geolite2-web-service

WIP (long term plan is to integrate this with an automated build process users can fork)

Skeleton of a web service able to do geolocation with the GeoLite2 database. To comply with the license, does not contain the database. Instead, the build process, when provided with a license key via environment variable, downloads the latest database and includes it in the built image. To comply with the license, if you complete the build process, you must ensure the build Docker image is not publicly accessible.

## building

1. Ensure you have Docker, tar, and curl installed.
1. Ensure you have the LICENSE_KEY env var set.
1. Run `download.sh`.
1. Run `build.sh`.

## uploading Docker image

1. Ensure you're logged into Docker Hub.
1. Ensure you have the DOCKER_HUB_ID env var set.
1. Run `docker push "${DOCKER_HUB_ID}/geolite2-web-service"`.
