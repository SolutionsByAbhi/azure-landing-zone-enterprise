@description('Root  management  group  ID  (e.g.  your  org  root)')
param  rootManagementGroupId  string

@description('Prefix  for  management  group  names')
param  mgPrefix  string  =  'corp'

resource  mgRoot  'Microsoft.Management/managementGroups@2021-04-01'  existing  =  {
    name:  rootManagementGroupId
}

resource  mgPlatform  'Microsoft.Management/managementGroups@2021-04-01'  =  {
    name:  '${mgPrefix}-platform'
    properties:  {
        displayName:  '${mgPrefix}-platform'
        parent:  {
            id:  mgRoot.id
        }
    }
}

resource  mgLandingZones  'Microsoft.Management/managementGroups@2021-04-01'  =  {
    name:  '${mgPrefix}-landingzones'
    properties:  {
        displayName:  '${mgPrefix}-landingzones'
        parent:  {
            id:  mgRoot.id
        }
    }
}

resource  mgSandbox  'Microsoft.Management/managementGroups@2021-04-01'  =  {
    name:  '${mgPrefix}-sandbox'
    properties:  {
        displayName:  '${mgPrefix}-sandbox'
        parent:  {
            id:  mgRoot.id
        }
    }
}

output  platformManagementGroupId  string  =  mgPlatform.id
output  landingZonesManagementGroupId  string  =  mgLandingZones.id
output  sandboxManagementGroupId  string  =  mgSandbox.id
