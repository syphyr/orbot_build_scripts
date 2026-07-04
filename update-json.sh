echo "Updating builtin-bridges.json"
cd orbot/scripts/
./update-bridges.sh
cd ..
#git add app/src/main/assets/builtin-bridges.json
git add app/src/main/assets/*.json
git commit -m "Update builtin bridges"
