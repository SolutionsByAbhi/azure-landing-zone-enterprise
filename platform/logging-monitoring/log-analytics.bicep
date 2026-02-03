@description('Location  for  Log  Analytics  workspace')
param  location  string  =  'westeurope'

@description('Workspace  name')
param  workspaceName  string  =  'law-landingzone'

resource  logAnalytics  'Microsoft.OperationalInsights/workspaces@2022-10-01'  =  {
    name:  workspaceName
    location:  location
    properties:  {
        sku:  {
            name:  'PerGB2018'
        }
        retentionInDays:  30
    }
}

output  logAnalyticsId  string  =  logAnalytics.id
