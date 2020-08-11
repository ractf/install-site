#!/usr/bin/env sh

[[ "$UID" != "0" ]] && echo "Run the RACTF install script as root." && exit 1

LOCATION=$(
  curl -s https://api.github.com/repos/ractf/install/releases/latest \
    | grep -Po '(?<="browser_download_url": ")(.+)' \
    | sed 's/"//' \
    | head -1
)

FILE=$(mktemp)

curl -SsL $LOCATION > $FILE
chmod +x $FILE

sh -c $FILE
