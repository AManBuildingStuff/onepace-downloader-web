#!/bin/sh
# Builds and registers "One Pace Helper.app" in ~/Applications. It handles
# onepace-dl:// links so one click on the web page adds every selected magnet
# to Transmission (browsers only allow a page to open one magnet per click).
set -e
cd "$(dirname "$0")/.."
APP="$HOME/Applications/One Pace Helper.app"
mkdir -p "$HOME/Applications"
rm -rf "$APP"
osacompile -o "$APP" helper/main.applescript
cp helper/add.sh "$APP/Contents/Resources/add.sh"
PL="$APP/Contents/Info.plist"
/usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier com.onepace.helper" "$PL" 2>/dev/null \
  || /usr/libexec/PlistBuddy -c "Add :CFBundleIdentifier string com.onepace.helper" "$PL"
/usr/libexec/PlistBuddy -c "Add :LSUIElement bool true" "$PL"
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes array" "$PL"
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0 dict" "$PL"
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0:CFBundleURLName string One Pace Helper" "$PL"
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0:CFBundleURLSchemes array" "$PL"
/usr/libexec/PlistBuddy -c "Add :CFBundleURLTypes:0:CFBundleURLSchemes:0 string onepace-dl" "$PL"
codesign --force --deep -s - "$APP" >/dev/null 2>&1
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f "$APP"
echo "Installed: $APP"
