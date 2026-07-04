cd shadowsocks-android
git clean -fdx
git reset --hard
git submodule foreach --recursive git clean -fdx
git submodule foreach --recursive git reset --hard
