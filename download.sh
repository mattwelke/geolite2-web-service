#!/bin/bash

# Delete any old directories
rm -r GeoLite2* 2> /dev/null

if [[ -z "${LICENSE_KEY}" ]]; then
  echo "Set LICENSE_KEY env var first."
  exit 1
fi

URL="https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=${LICENSE_KEY}&suffix=tar.gz"
FILENAME="GeoLite2-City.mmdb"
FILENAME_DOWNLOADED="dl.tar.gz"

wget -O $FILENAME_DOWNLOADED $URL
tar -xzf $FILENAME_DOWNLOADED

FILE_PATH="$(ls | grep GeoLite2-City | xargs realpath)/$FILENAME"

mv $FILE_PATH "./db"

# Cleanup
rm $FILENAME_DOWNLOADED
rm -r GeoLite2* 2> /dev/null
