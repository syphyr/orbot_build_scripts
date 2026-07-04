#sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.11.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.17.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.21.0-openjdk-amd64

#java -version
#javac -version

#export ANDROID_NDK_HOME=~/src/android-ndk-r21e
#export PATH=$ANDROID_NDK_HOME:$PATH

./clean-shadowsocks.sh
cd orbot

#./gradlew clean
#./gradlew --stop

git clean -fdx -e keystore.properties
git reset --hard
git submodule foreach --recursive git clean -fdx
git submodule foreach --recursive git reset --hard
git describe --tags --always
