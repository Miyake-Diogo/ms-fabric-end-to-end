param projectName string
param location string = 'eastus'

var resourceGroupName = '${projectName}-rg'
var servicePrincipalName = '${projectName}-sp'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

resource servicePrincipal 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().subscriptionId, servicePrincipalName)
  properties: {
    principalId: servicePrincipalName
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b24988ac-6180-42a0-ab88-20f7382dd24c') // Contributor
    scope: resourceGroup.id
  }
}

resource oneLakeRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().subscriptionId, servicePrincipalName, 'Storage Blob Data Contributor')
  properties: {
    principalId: servicePrincipalName
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe') // Storage Blob Data Contributor
    scope: resourceGroup.id
  }
}

resource aiFoundryRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().subscriptionId, servicePrincipalName, 'Cognitive Services Contributor')
  properties: {
    principalId: servicePrincipalName
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'f0f5c3a7-9dcb-4b3e-b61a-82b3b1e3e4b4') // Cognitive Services Contributor
    scope: resourceGroup.id
  }
}

resource openAiRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().subscriptionId, servicePrincipalName, 'Cognitive Services Contributor')
  properties: {
    principalId: servicePrincipalName
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'f0f5c3a7-9dcb-4b3e-b61a-82b3b1e3e4b4') // Cognitive Services Contributor
    scope: resourceGroup.id
  }
}

resource mlRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().subscriptionId, servicePrincipalName, 'Contributor')
  properties: {
    principalId: servicePrincipalName
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'b24988ac-6180-42a0-ab88-20f7382dd24c') // Contributor
    scope: resourceGroup.id
  }
}

resource storageRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().subscriptionId, servicePrincipalName, 'Storage Blob Data Contributor')
  properties: {
    principalId: servicePrincipalName
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe') // Storage Blob Data Contributor
    scope: resourceGroup.id
  }
}

resource cosmosDbRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().subscriptionId, servicePrincipalName, 'Cosmos DB Account Contributor')
  properties: {
    principalId: servicePrincipalName
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5bd9cd88-fe45-4216-938b-f97437e15450') // Cosmos DB Account Contributor
    scope: resourceGroup.id
  }
}

resource sqlRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  name: guid(subscription().subscriptionId, servicePrincipalName, 'SQL DB Contributor')
  properties: {
    principalId: servicePrincipalName
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '9b7fa17d-e63e-47b0-bb0a-15c516ac86ec') // SQL DB Contributor
    scope: resourceGroup.id
  }
}
