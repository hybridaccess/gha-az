#!/usr/bin/env bash

set -ex

# test

PROPERTIES=$(printenv |jq -R .|jq -s .)

# az login --service-principal --username $azuread_application_id --password $azuread_client_secret

# eval "$(jq -r '@sh "RESOURCE_GROUP=\(.resource_group) SUBSCRIPTION_NAME=\(.subscription)"')"

# PROPERTIES=$(az group show --resource-group "$RESOURCE_GROUP" --subscription "$SUBSCRIPTION_NAME" --query "properties" -o json)

jq -n --arg properties "$PROPERTIES" '{"properties":$properties}'
