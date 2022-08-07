#!/bin/sh -l

syft packages "docker:$1" -o json=sbom.syft.json -o spdx-json=sbom.spdx.json
cat sbom.syft.json

grype "docker:$1" -o json > grype.json
cat grype.json

findings=$(cat grype.json)
echo "::set-output name=findings::$findings"
