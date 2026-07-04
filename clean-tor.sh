##sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
##sudo update-java-alternatives -s java-1.11.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.17.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.25.0-openjdk-amd64

#java -version
#javac -version

#export ANDROID_NDK_HOME=~/src/android-ndk-r21e

#ndkVersion=$(sed -En 's,NDK_REQUIRED_REVISION *:?= *([0-9.]+).*,\1,p' tor-android/external/Makefile)
#export ANDROID_NDK_HOME="$ANDROID_HOME/ndk/$ndkVersion"

#export PATH=$ANDROID_NDK_HOME:$PATH

cd tor-android
#./tor-droid-make.sh fetch -c
#./gradlew clean
git clean -fdx
git reset --hard
git submodule foreach --recursive git clean -fdx
git submodule foreach --recursive git reset --hard
git describe --tags --always
