#!/bin/bash
set -euo pipefail

LOCATION="$HOME/Downloads"
URL_PAGE="https://www.universalmediaserver.com/download/"
URL_DL_FMT="https://sourceforge.net/projects/unimediaserver/files/{VERSION}/UMS-{VERSION}-x86_64.tgz"
# Optional: pin a known-good version to override the scraped one, e.g. VERSION="7.2.1"
VERSION="${VERSION:-}"
# Optional: pin the expected SHA-256 of the release tarball to force verification
EXPECTED_SHA256="${EXPECTED_SHA256:-}"

if [ -z "$VERSION" ]; then
  VERSION=$(curl -fsSL "$URL_PAGE" | grep -o -P '(?<=UMS-)[0-9][0-9.]+(?=-x86_64\.tgz)')
fi
# Only allow a strict semver-like version into the URL to prevent path injection
if ! [[ "$VERSION" =~ ^[0-9]+(\.[0-9]+)*$ ]]; then
  echo "Refusing to proceed: parsed version '$VERSION' looks invalid." >&2
  exit 1
fi

UMSFILE="$LOCATION/UMS-$VERSION-x86_64.tgz"
DOWNLOAD_URL="${URL_DL_FMT//\{VERSION\}/$VERSION}"

echo "Downloading UMS $VERSION to $UMSFILE:"
wget -q --show-progress -O "$UMSFILE" "$DOWNLOAD_URL"

if [ -z "$EXPECTED_SHA256" ]; then
  echo "WARNING: no EXPECTED_SHA256 set — skipping integrity check." >&2
else
  ACTUAL_SHA256=$(sha256sum "$UMSFILE" | awk '{print $1}')
  if [ "$ACTUAL_SHA256" != "$EXPECTED_SHA256" ]; then
    echo "SHA-256 mismatch (expected $EXPECTED_SHA256, got $ACTUAL_SHA256). Aborting." >&2
    rm -f "$UMSFILE"
    exit 1
  fi
fi

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

echo "Extracting to $TMPDIR:"
tar xzf "$UMSFILE" -C "$TMPDIR"

if ! ls "$TMPDIR"/ums-* -d >/dev/null 2>&1; then
  echo "No ums-* directory found in archive. Aborting." >&2
  exit 1
fi
EXTRACTED=$(ls -d "$TMPDIR"/ums-*)
echo "Extracted content: $EXTRACTED"

read -rp "Clean /opt/ums/? (y/N) " rpinput
echo ""
if [ "$rpinput" = "y" ] || [ "$rpinput" = "Y" ]; then
  echo "Removing /opt/ums:"
  sudo rm -rvf /opt/ums
fi

echo "Moving files from $EXTRACTED to /opt/ums:"
sudo mv -v "$EXTRACTED" /opt/ums/

rm -f "$UMSFILE"
echo "All done. Exiting."
