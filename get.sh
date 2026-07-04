
if [ ! -d jsocksandroid ]; then
   git clone https://gitlab.com/guardianproject/jsocksandroid
   cd jsocksandroid
   git remote add syphyr https://gitlab.com/syphyr/jsocksandroid
   cd ..
fi

cd jsocksandroid
git checkout master
git fetch
git rebase
git log --pretty="%C(yellow)%h %C(green)(%cr) %C(red)(%ar) %C(white)%s %C(blue)(%an)" -10 origin/master
cd ..

if [ ! -d jtorctl ]; then
   git clone https://github.com/guardianproject/jtorctl
   cd jtorctl
   git remote add syphyr https://github.com/syphyr/jtorctl
   cd ..
fi

cd jtorctl
git checkout release-0.4.9
git fetch
git rebase
git log --pretty="%C(yellow)%h %C(green)(%cr) %C(red)(%ar) %C(white)%s %C(blue)(%an)" -10 origin/master
cd ..

if [ ! -d orbot ]; then
   git clone https://github.com/guardianproject/orbot
   cd orbot
   git remote add syphyr https://github.com/syphyr/orbot
   cd ..
fi

cd orbot
git checkout master
git fetch
git rebase
git submodule update --init --recursive
git log --pretty="%C(yellow)%h %C(green)(%cr) %C(red)(%ar) %C(white)%s %C(blue)(%an)" -10 origin/master
cd ..

if [ ! -d tor-android ]; then
   git clone https://github.com/guardianproject/tor-android
   cd tor-android
   git remote add syphyr https://github.com/syphyr/tor-android
   cd ..
fi

cd tor-android
git checkout master
git fetch
git rebase
git submodule update --init --recursive
git log --pretty="%C(yellow)%h %C(green)(%cr) %C(red)(%ar) %C(white)%s %C(blue)(%an)" -10 origin/master

