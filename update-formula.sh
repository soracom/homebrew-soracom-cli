#!/bin/bash

VERSION=$1
if [ "$VERSION" == "" ]; then
    echo "please specify a version number like '1.2.3' as the first argument"
    exit 1
fi

set -Eeuo pipefail

: "Calculate checksum" && {
    SHA256_MAC_amd64=$(curl -s -L "https://github.com/soracom/soracom-cli/releases/download/v$VERSION/soracom_${VERSION}_darwin_amd64" | shasum -a 256 | cut -f 1 -d ' ' )
    SHA256_MAC_arm64=$(curl -s -L "https://github.com/soracom/soracom-cli/releases/download/v$VERSION/soracom_${VERSION}_darwin_arm64"   | shasum -a 256 | cut -f 1 -d ' ' )
    SHA256_LINUX_amd64=$(curl -s -L "https://github.com/soracom/soracom-cli/releases/download/v$VERSION/soracom_${VERSION}_linux_amd64" | shasum -a 256 | cut -f 1 -d ' ' )
    SHA256_LINUX_arm64=$(curl -s -L "https://github.com/soracom/soracom-cli/releases/download/v$VERSION/soracom_${VERSION}_linux_arm64" | shasum -a 256 | cut -f 1 -d ' ' )
    SHA256_LINUX_386=$(curl -s -L "https://github.com/soracom/soracom-cli/releases/download/v$VERSION/soracom_${VERSION}_linux_386"   | shasum -a 256 | cut -f 1 -d ' ' )
    SHA256_LINUX_arm=$(curl -s -L "https://github.com/soracom/soracom-cli/releases/download/v$VERSION/soracom_${VERSION}_linux_arm"   | shasum -a 256 | cut -f 1 -d ' ' )
}

sed -e "s/VERSION *=.*/VERSION = \"$VERSION\"/g"       -i'.bak' soracom-cli.rb
sed -e "s/SHA256_MAC_amd64 *=.*/SHA256_MAC_amd64 = \"$SHA256_MAC_amd64\"/g" -i'.bak' soracom-cli.rb
sed -e "s/SHA256_MAC_arm64 *=.*/SHA256_MAC_arm64 = \"$SHA256_MAC_arm64\"/g" -i'.bak' soracom-cli.rb
sed -e "s/SHA256_LINUX_amd64 *=.*/SHA256_LINUX_amd64 = \"$SHA256_LINUX_amd64\"/g" -i'.bak' soracom-cli.rb
sed -e "s/SHA256_LINUX_arm64 *=.*/SHA256_LINUX_arm64 = \"$SHA256_LINUX_arm64\"/g" -i'.bak' soracom-cli.rb
sed -e "s/SHA256_LINUX_386 *=.*/SHA256_LINUX_386 = \"$SHA256_LINUX_386\"/g" -i'.bak' soracom-cli.rb
sed -e "s/SHA256_LINUX_arm *=.*/SHA256_LINUX_arm = \"$SHA256_LINUX_arm\"/g" -i'.bak' soracom-cli.rb

