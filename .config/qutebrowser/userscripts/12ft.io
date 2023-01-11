#!/usr/bin/env bash

id=$(echo "$QUTE_URL" | grep -o "status/[0-9]*" | grep -o "[0-9]*$")
url=$QUTE_URL

echo ":open -p 12ft.io/proxy?q=$url" >> "$QUTE_FIFO"
