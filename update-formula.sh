#!/bin/bash
d="$( cd "$(dirname "$0")"; pwd )"

VERSION=$1
if [ "$VERSION" == "" ]; then
    echo "please specify a version number like '1.2.3' as the first argument"
    exit 1
fi

: "Calculate checksum" && {
    SHA256_32=$(curl -s -L "https://github.com/soracom/soracom-cli/releases/download/v$VERSION/soracom_${VERSION}_darwin_386"   | shasum -a 256 | cut -f 1 -d ' ' )
    SHA256_64=$(curl -s -L "https://github.com/soracom/soracom-cli/releases/download/v$VERSION/soracom_${VERSION}_darwin_amd64" | shasum -a 256 | cut -f 1 -d ' ' )
}

sed -e "s/VERSION *=.*/VERSION = \"$VERSION\"/g"       -i '.bak' soracom-cli.rb
sed -e "s/SHA256_32 *=.*/SHA256_32 = \"$SHA256_32\"/g" -i '.bak' soracom-cli.rb
sed -e "s/SHA256_64 *=.*/SHA256_64 = \"$SHA256_64\"/g" -i '.bak' soracom-cli.rb
