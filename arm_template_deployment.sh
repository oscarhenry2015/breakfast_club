#!/bin/bash

# Login to Azure (if not already logged in)
#az login --tenant 72b7ff39-ea55-4d53-924c-80758b5dba9b

# Create a resource group (if not already created)
az group create --name Breakfast_Club_RG --location eastus2

# Deploy PostgreSQL to Azure
az deployment group create \
  --name postgreSQLDeployment \
  --resource-group Breakfast_Club_RG \
  --template-file templates/postgreSQL_template.json \
  --parameters parameters/postgreSQL_parameters.json \
  --parameters administratorLoginPassword="P@ss1234"

# Deploy WebApp and App Service Plan to Azure
az deployment group create \
  --name WebAppDeployment \
  --resource-group Breakfast_Club_RG \
  --template-file templates/webApp_template.json \
  --parameters parameters/webApp_parameters.json \