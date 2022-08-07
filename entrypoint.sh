#!/bin/sh -l

ls -alh
echo "running syft..."
sudo syft packages "docker:$1" -o json=sbom.syft.json -o spdx-json=sbom.spdx.json
echo "...Done."
ls -alh
cat sbom.syft.json

echo "running grype..."
sudo grype "docker:$1" -o json > grype.json
echo "...Done."
ls -alh
cat grype.json

findings=$(cat grype.json)
echo "::set-output name=findings::$findings"
