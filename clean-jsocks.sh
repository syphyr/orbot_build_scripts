#sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.11.0-openjdk-amd64
#java -version
#javac -version

#export ANDROID_NDK_HOME=~/src/android-ndk-r21e
#export PATH=$ANDROID_NDK_HOME:$PATH

cd jsocksandroid

#VERSION=$(git describe --tags --always);

#./gradlew clean
git clean -fdx
git reset --hard
git describe --tags --always
