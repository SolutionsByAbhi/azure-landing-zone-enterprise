@description('AAD  group  object  IDs  for  platform  roles')
param  platformAdmins  array
param  platformOperators  array

@description('Managed  identity  name  for  platform  automation')
param  platformAutomationMiName  string  =  'mi-platform-automation'

resource  platformAutomationMi  'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31'  =  {
    name:  platformAutomationMiName
    location:  resourceGroup().location
}

output  platformAutomationMiId  string  =  platformAutomationMi.id
