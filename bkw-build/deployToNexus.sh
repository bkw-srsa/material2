#!/usr/bin/env bash

REGISTRY=https://nexus.vc-nord.de/nexus/repository/npm-bkw/


packages=`find dist/@angular/material -name 'package.json'`

for p in ${packages}; do
  folder="${p/package.json/}"
  npm publish ${folder} --registry=${REGISTRY}
done