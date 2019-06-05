watchman watch-del-all
rm -rf $TMPDIR/react-* node_modules/ ios/build ios/Pods android/app/build/
npm cache clean --force
npm install