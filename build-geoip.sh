cd tor-android

VERSION=$(git describe --tags --always)

cd ../geoip

if [ ! -d assets ]; then
	mkdir assets
fi

#wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-Country.mmdb.gz
#gunzip GeoLite2-Country.mmdb.gz
#python3 mmdb-convert.py GeoLite2-Country.mmdb --make-maven-artifacts

cp -a ../tor-android/external/tor/src/config/geoip assets/
cp -a ../tor-android/external/tor/src/config/geoip6 assets/

zip -o geoip.jar assets/geoip assets/geoip6

cd ..

if [ ! -d maven/info/guardianproject/geoip/$VERSION ]; then
	mkdir -p maven/info/guardianproject/geoip/$VERSION
	echo "Created new Maven directory for $VERSION"
else
	echo "Maven directory for $VERSION already exists"
fi

cp -a -v geoip/geoip.jar maven/info/guardianproject/geoip/$VERSION/geoip-$VERSION.jar
#cp -a -v geoip/geoip-sources.jar maven/info/guardianproject/geoip/$VERSION/geoip-$VERSION-sources.jar
cp -a -v geoip/geoip.pom maven/info/guardianproject/geoip/$VERSION/geoip-$VERSION.pom
sed -i "s/FIXME/$VERSION/g" maven/info/guardianproject/geoip/$VERSION/geoip-$VERSION.pom
echo "Copied files to maven directory"
