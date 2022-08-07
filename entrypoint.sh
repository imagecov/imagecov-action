#!/bin/sh -l

echo "running syft..."
syft packages "docker:$1" -o json=sbom.syft.json -o spdx-json=sbom.spdx.json
echo "...Done."
head sbom.syft.json

echo "running grype..."
grype "docker:$1" -o json > grype.json
echo "...Done."
head grype.json

ls -alh

# Set an output?
# findings=$(cat grype.json)
# echo "::set-output name=findings::$findings"
