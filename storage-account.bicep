param storageAccountName string = 'cognitozbicep123'
param location string = 'East Asia'
param resourceGroupName string = 'demo-az104-rg'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {}
}