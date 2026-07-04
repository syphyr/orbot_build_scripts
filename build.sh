#sudo update-java-alternatives -s java-1.8.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.11.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.17.0-openjdk-amd64
#sudo update-java-alternatives -s java-1.21.0-openjdk-amd64
sudo update-java-alternatives -s java-1.25.0-openjdk-amd64

java -version
javac -version

#export ANDROID_NDK_HOME=~/src/android-ndk-r21e
#export PATH=$ANDROID_NDK_HOME:$PATH

cd orbot

#./gradlew assemble
./gradlew assembleRelease
#./gradlew assembleDebug
./gradlew --stop
