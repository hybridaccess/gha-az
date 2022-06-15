#!/bin/bash

set -ex

function check_deps() {
  test -f $(which jq) || error_exit "jq command not detected in path, please install it"
  test -f $(which az) || error_exit "az command not detected in path, please install it"
}
function parse_input() {
  eval "$(jq -r '@sh "export AZ_TENANT=\(.tenant_id)"')"
  if [[ -z "${AZ_TENANT}" ]]; then export AZ_TENANT=none; fi
}

check_deps
parse_input

az login --service-principal --username $azuread_application_id --password $azuread_client_secret --tenant $AZ_TENANT

eval "$(jq -r '@sh "RESOURCE_GROUP=\(.resource_group) SUBSCRIPTION_NAME=\(.subscription)"')"

PROPERTIES=$(az group show --resource-group "$RESOURCE_GROUP" --subscription "$SUBSCRIPTION_NAME" --query "properties" -o json)

jq -n --arg properties "$PROPERTIES" '{"properties":$properties}'
