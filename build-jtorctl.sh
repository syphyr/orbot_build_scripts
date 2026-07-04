sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.11.0-openjdk-amd64
java -version
javac -version

#export ANDROID_NDK_HOME=~/src/android-ndk-r21e
#export PATH=$ANDROID_NDK_HOME:$PATH

cd jtorctl

VERSION=$(git describe --tags --always)

./gradlew assemble

cd ..

if [ ! -d maven/info/guardianproject/jtorctl/$VERSION ]; then
	mkdir -p maven/info/guardianproject/jtorctl/$VERSION
	echo "Created new Maven directory for $VERSION"
else
	echo "Maven directory for $VERSION already exists"
fi

cp -a -v jtorctl/build/libs/* maven/info/guardianproject/jtorctl/$VERSION/
cp -a -v jtorctl/jtorctl.pom maven/info/guardianproject/jtorctl/$VERSION/jtorctl-$VERSION.pom
echo "Copied files to maven directory"
