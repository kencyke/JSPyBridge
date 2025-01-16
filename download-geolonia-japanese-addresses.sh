#!/bin/bash
set -eu

JAPANESE_ADDRESSES_V2_VERSION=0.0.5
curl -sL https://github.com/geolonia/japanese-addresses-v2/archive/refs/tags/v${JAPANESE_ADDRESSES_V2_VERSION}.tar.gz | tar -xvzf - --transform "s/japanese-addresses-v2-${JAPANESE_ADDRESSES_V2_VERSION}/japanese-addresses-v2/"
cd ./japanese-addresses-v2
npm install
npm run run:all
rsync -a --mkpath ./out/api/ ${GITHUB_WORKSPACE}/japanese-addresses/v2/v${JAPANESE_ADDRESSES_V2_VERSION}/api/

cd ../
rm -rf ./japanese-addresses-v2