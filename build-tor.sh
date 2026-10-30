gcc --version
g++ --version
cpp --version

#sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.11.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.17.0-openjdk-amd64
sudo update-java-alternatives -s java-1.25.0-openjdk-amd64

java -version
javac -version

python3 --version

export JAVA_HOME=$(readlink -f `which javac` | sed "s:/bin/javac::")
echo "JAVA_HOME is set to $JAVA_HOME"

#export ANDROID_NDK_HOME=~/src/android-ndk-r21e

ndkVersion=$(sed -En 's,NDK_REQUIRED_REVISION *:?= *([0-9.]+).*,\1,p' tor-android/external/Makefile)
export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/$ndkVersion"
export ANDROID_NDK_ROOT=$ANDROID_NDK_HOME

echo "ANDROID_NDK_HOME is set to $ANDROID_NDK_HOME"

export PATH=$ANDROID_NDK_HOME:$PATH
#export PATH=$ANDROID_NDK_HOME:$ANDROID_NDK_HOME/prebuilt/linux-x86_64/bin:$PATH

make --version

cd tor-android

VERSION=$(git describe --tags --always)

## default_abis="arm64-v8a armeabi-v7a x86 x86_64"

./tor-droid-make.sh release -a arm64-v8a
#./tor-droid-make.sh build -a arm64-v8a -b release
#./tor-droid-make.sh build -a arm64-v8a

cd ..

if [ ! -d maven/info/guardianproject/tor-android/$VERSION ]; then
	mkdir -p maven/info/guardianproject/tor-android/$VERSION
	echo "Created new Maven directory for $VERSION"
else
	echo "Maven directory for $VERSION already exists"
fi

cp -a -v tor-android/tor-android-binary/build/outputs/aar/* maven/info/guardianproject/tor-android/$VERSION/
echo "Copied files to maven directory"

