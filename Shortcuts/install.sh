#!/bin/sh

sh -c "find . -name \*.desktop -exec cp {} $HOME/.local/share/applications/ \;"
echo "Shortcuts copied."
