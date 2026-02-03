@description('Target  Log  Analytics  workspace  ID')
param  logAnalyticsId  string

@description('Resource  IDs  to  attach  diagnostics  to')
param  resourceIds  array

resource  diagSettings  'Microsoft.Insights/diagnosticSettings@2021-05-01-preview'  =  [for  r  in  resourceIds:  {
    name:  'diag-${last(split(r,  '/'))}'
    scope:  r
    properties:  {
        workspaceId:  logAnalyticsId
        logs:  [
            {
                category:  'AuditEvent'
                enabled:  true
            }
        ]
        metrics:  [
            {
                category:  'AllMetrics'
                enabled:  true
            }
        ]
    }
}]
