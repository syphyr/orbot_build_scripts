cd orbot
VERSION=$(git describe --tags --always)
cd ..

if [ -f orbot/app/build/outputs/apk/fullperm/release/*arm64-v8a-release.apk ]; then
   cp -a -v orbot/app/build/outputs/apk/fullperm/release/*arm64-v8a-release.apk ~/Downloads/apk/Orbot-"$VERSION"-fullperm-arm64-v8a-release.apk
   echo "Orbot arm64 build copied to d/l dir."
fi

if [ -f orbot/app/build/outputs/apk/fullperm/release/*armeabi-v7a-release.apk ]; then
   cp -a -v orbot/app/build/outputs/apk/fullperm/release/*armeabi-v7a-release.apk ~/Downloads/apk/Orbot-"$VERSION"-fullperm-armeabi-v7a-release.apk
   echo "Orbot arm build copied to d/l dir."
fi

if [ ! -f orbot/app/build/outputs/apk/fullperm/release/*arm64-v8a-release.apk ] && [ ! -f orbot/app/build/outputs/apk/fullperm/release/*armeabi-v7a-release.apk ]; then
   echo "No files built"
fi

