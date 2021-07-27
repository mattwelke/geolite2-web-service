# geolite2-web-service

WIP (long term plan is to integrate this with an automated build process users can fork)

Skeleton of a web service able to do geolocation with the GeoLite2 database. To comply with the license, does not contain the database. Instead, the build process, when provided with a license key via environment variable, downloads the latest database and includes it in the built image. To comply with the license, if you complete the build process, you must ensure the built Docker image is not publicly accessible.

See https://www.maxmind.com/en/geolite2/eula for license details.

## Examples

```bash
# To avoid IP ending up in logs, uses POST with the IP as the request body.
# No encoding needed because it's just an IP address (no JSON, etc).
MY_IP=$(curl -s https://api.ipify.org/)
curl -XPOST -H 'Content-Type: text/plain' -d $MY_IP http://localhost:8080/geo
```

Example response with 8.8.8.8 (formatted) as of July 27th, 2021:

```
{
   "City":{
      "GeoNameID":0,
      "Names":null
   },
   "Continent":{
      "Code":"NA",
      "GeoNameID":6255149,
      "Names":{
         "de":"Nordamerika",
         "en":"North America",
         "es":"Norteamérica",
         "fr":"Amérique du Nord",
         "ja":"北アメリカ",
         "pt-BR":"América do Norte",
         "ru":"Северная Америка",
         "zh-CN":"北美洲"
      }
   },
   "Country":{
      "GeoNameID":6252001,
      "IsInEuropeanUnion":false,
      "IsoCode":"US",
      "Names":{
         "de":"USA",
         "en":"United States",
         "es":"Estados Unidos",
         "fr":"États-Unis",
         "ja":"アメリカ合衆国",
         "pt-BR":"Estados Unidos",
         "ru":"США",
         "zh-CN":"美国"
      }
   },
   "Location":{
      "AccuracyRadius":1000,
      "Latitude":37.751,
      "Longitude":-97.822,
      "MetroCode":0,
      "TimeZone":"America/Chicago"
   },
   "Postal":{
      "Code":""
   },
   "RegisteredCountry":{
      "GeoNameID":6252001,
      "IsInEuropeanUnion":false,
      "IsoCode":"US",
      "Names":{
         "de":"USA",
         "en":"United States",
         "es":"Estados Unidos",
         "fr":"États-Unis",
         "ja":"アメリカ合衆国",
         "pt-BR":"Estados Unidos",
         "ru":"США",
         "zh-CN":"美国"
      }
   },
   "RepresentedCountry":{
      "GeoNameID":0,
      "IsInEuropeanUnion":false,
      "IsoCode":"",
      "Names":null,
      "Type":""
   },
   "Subdivisions":null,
   "Traits":{
      "IsAnonymousProxy":false,
      "IsSatelliteProvider":false
   }
}
```

## Building Docker image

1. Ensure you have Docker, tar, and curl installed.
1. Ensure you have the `LICENSE_KEY` env var set.
1. Run `download.sh`.
1. Run `build.sh`.

## Uploading Docker image

1. Ensure you're logged into Docker Hub.
1. Ensure you have the `DOCKER_HUB_ID` env var set.
1. Run `docker push "${DOCKER_HUB_ID}/geolite2-web-service"`.
