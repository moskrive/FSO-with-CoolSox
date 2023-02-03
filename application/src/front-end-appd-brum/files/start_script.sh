#!/bin/sh

# Allow Container to come up
sleep 5

# Replace AppD BRUM parameters with the value of environment variables
/bin/sed -i s/AppD_appKey/${AppD_appKey}/g /usr/src/app/public/*.html
/bin/sed -i s/AppD_adrumExtUrlHttps/${AppD_adrumExtUrlHttps}/g /usr/src/app/public/*.html
/bin/sed -i s/AppD_adrumExtUrlHttp/${AppD_adrumExtUrlHttp}/g /usr/src/app/public/*.html
/bin/sed -i s/AppD_beaconUrlHttps/${AppD_beaconUrlHttps}/g /usr/src/app/public/*.html
/bin/sed -i s/AppD_beaconUrlHttp/${AppD_beaconUrlHttp}/g /usr/src/app/public/*.html
/bin/sed -i s/AppD_adrumLocation/${AppD_adrumLocation}/g /usr/src/app/public/*.html

# -i "start the webserver
/usr/local/bin/npm start