

flutter build web
cp -r ./build/web ../myafer.github.io

cd ../myafer.github.io
git add .
git commit -m "更新"
# git push -u origin main
git push