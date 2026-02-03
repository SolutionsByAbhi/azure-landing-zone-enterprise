@description('Management  group  ID  under  which  new  subscriptions  will  be  placed')
param  targetManagementGroupId  string

@description('Display  name  for  new  subscription')
param  subscriptionDisplayName  string

@description('Billing  scope  for  subscription  (e.g.  /providers/Microsoft.Billing/billingAccounts/...)')
param  billingScope  string

resource  sub  'Microsoft.Subscription/aliases@2020-09-01'  =  {
    name:  toLower(replace(subscriptionDisplayName,  '  ',  '-'))
    properties:  {
        displayName:  subscriptionDisplayName
        billingScope:  billingScope
        workload:  'Production'
        managementGroupId:  targetManagementGroupId
    }
}

output  subscriptionId  string  =  sub.properties.subscriptionId
