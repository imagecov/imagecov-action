#!/bin/sh -l

echo "running syft..."
syft packages "docker:$1" -o json=sbom.syft.json -o spdx-json=sbom.spdx.json
echo "...Done."
head sbom.syft.json

echo "running grype..."
grype "docker:$1" -o json --fail-on "$2" > grype.json
echo "...Done."
head grype.json

zip findings.zip sbom.syft.json sbom.spdx.json grype.json

ls -alh

## TODO Scan the grype, compare with input threshold, emit success or failure


# Set an output?
# findings=$(cat grype.json)
# echo "::set-output name=findings::$findings"
