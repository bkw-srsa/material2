#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${DIR}/..

rm -rf target
mkdir target

cp bkw-build/.htaccess dist

cd dist
zip -r ../target/bkw-material.zip ./
cd ..

echo "Packed bkw-material.zip successfully. Stored in target/bkw-material.zip"
