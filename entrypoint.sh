#!/bin/sh -l

echo "running syft..."
syft packages "docker:$1" -o json=sbom.syft.json -o spdx-json=sbom.spdx.json
echo "...Done."

echo "running grype..."
grype "docker:$1" -o json --fail-on "$2" > grype.json
status=$?
echo "...Done."

zip findings.zip sbom.syft.json sbom.spdx.json grype.json

echo "MOCK SEND DATA"

echo "Imagecov workflow finished succesfully."

[ $status -eq 0 ] && echo "Any discovered vulnerabilities were below the severity threshold." || echo "Vulnerabilities were discovered at or above the severity threshold."

exit $status
