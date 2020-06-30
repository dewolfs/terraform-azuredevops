#!/bin/bash

set -e

# Create resource group
DEV_RESOURCE_GROUP="_rg-iac-dev-we-01"
PROD_RESOURCE_GROUP="_rg-iac-prod-we-01"
LOCATION="westeurope"
az group create --name $DEV_RESOURCE_GROUP --location $LOCATION 
echo "resource group $DEV_RESOURCE_GROUP created."
az group create --name $PROD_RESOURCE_GROUP --location $LOCATION
echo "resource group $PROD_RESOURCE_GROUP created."

# Create storage account
DEV_STOR_NAME="stodevwestiac01"
PROD_STOR_NAME="stoprodwestiac01"
az storage account create --resource-group $DEV_RESOURCE_GROUP --location $LOCATION \
    --name $DEV_STOR_NAME \
    --sku Standard_LRS \
    --encryption-services blob \
    --https-only true
echo "Storage account $DEV_STOR_NAME created."
az storage account create --resource-group $PROD_RESOURCE_GROUP --location $LOCATION \
    --name $PROD_STOR_NAME \
    --sku Standard_LRS \
    --encryption-services blob \
    --https-only true
echo "Storage account $PROD_STOR_NAME created."

# Get storage account key
DEV_ACC_KEY=$(az storage account keys list --resource-group $DEV_RESOURCE_GROUP --account-name $DEV_STOR_NAME --query [0].value -o tsv)
echo "Account key from $DEV_STOR_NAME retrieved."
PROD_ACC_KEY=$(az storage account keys list --resource-group $PROD_RESOURCE_GROUP --account-name $PROD_STOR_NAME --query [0].value -o tsv)
echo "Account key from $PROD_STOR_NAME retrieved."

# Create storage account container
DEV_STOR_CONTAINER="tfstate"
PROD_STOR_CONTAINER="tfstate"
az storage container create --name $DEV_STOR_CONTAINER --account-name $DEV_STOR_NAME --account-key $DEV_ACC_KEY
echo "Storage container $DEV_STOR_CONTAINER created."
az storage container create --name $PROD_STOR_CONTAINER --account-name $PROD_STOR_NAME --account-key $PROD_ACC_KEY
echo "Storage container $PROD_STOR_CONTAINER created."