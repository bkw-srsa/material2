#!/usr/bin/env bash

VERSION=$(grep "version" package.json | cut -d \: -f 2 | sed 's/\"//g' | sed 's/\,//g' | xargs)
echo "actual version: ${VERSION}"

NEW_VERSION=x
if [[ "$VERSION" == *-bkw-* ]]; then
    # increasing BKW version
    VERSION_NUMBER=${VERSION##*-}
    NEXT_VERSION_NUMBER=$((VERSION_NUMBER+1))
    ORIGINAL_VERSION=${VERSION%-bkw-*}
    NEW_VERSION=${ORIGINAL_VERSION}-bkw-${NEXT_VERSION_NUMBER}
else
    # applying BKW Version
    NEW_VERSION=${VERSION}-bkw-1
fi
echo "new version:    ${NEW_VERSION}"

# updating package.json files
packages=$(find src/lib -name 'package.json')
for p in ${packages}; do
  sed -i '' "s/${VERSION}/${NEW_VERSION}/g" ${p}
done
sed -i '' "s/${VERSION}/${NEW_VERSION}/g" package.json
echo "updated package.json files"
exit 0