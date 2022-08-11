# Imagecov docker action

This action will perform the following:
  1. scan a docker image
  1. upload the Software Bill of Materials and Vulnerabitlity findings to the imagecov service
  1. inform the user if vulnerabilities exceeds the severity tolerance

## Inputs

### `customer_image`

**Required** The docker image to be scanned. This image can be built in a workflow step just before calling this action, or this image can be pulled from docker hub.

### `fail_on`

**Optional** The severity threshold for failing the workflow. Default `None`.

## Example usage

uses: imagecov/imagecov-action@main
with:
  customer_image: vulnerables/web-dvwa:latest
  fail_on: critical
