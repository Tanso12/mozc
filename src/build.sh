python build_mozc.py gyp --target_platform=Android --android_arch=arm64
python build_mozc.py build -c Debug android/android.gyp:apk
zip -r android64 android
