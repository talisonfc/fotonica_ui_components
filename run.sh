flutter clean
flutter pub get
cd example
flutter build web
cd ..
rm -rf docs
mkdir docs
cp -r  example/build/web/ docs/
