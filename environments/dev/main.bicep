@description('Location  for  dev  environment')
param  location  string  =  'westeurope'

@description('Hub  VNet  ID')
param  hubVnetId  string

@description('Log  Analytics  workspace  ID')
param  logAnalyticsId  string

@description('Dev  subscription  ID')
param  devSubscriptionId  string

targetScope  =  'subscription'

resource  rgDev  'Microsoft.Resources/resourceGroups@2021-04-01'  =  {
    name:  'rg-dev-landingzone'
    location:  location
}

module  spokeApp  '../platform/networking/spokes/spoke-app.bicep'  =  {
    name:  'spoke-app-dev'
    scope:  rgDev
    params:  {
        location:  location
        spokeVnetName:  'vnet-spoke-app-dev'
        spokeAddressSpace:  [
            '10.20.0.0/16'
        ]
        appSubnetCidr:  '10.20.1.0/24'
    }
}

module  diag  '../platform/logging-monitoring/diagnostics.bicep'  =  {
    name:  'diag-dev'
    scope:  rgDev
    params:  {
        logAnalyticsId:  logAnalyticsId
        resourceIds:  [
            spokeApp.outputs.spokeVnetId
        ]
    }
}
