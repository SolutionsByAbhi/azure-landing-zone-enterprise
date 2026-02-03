@description('Scope  for  security  baseline  policy  assignment')
param  assignmentScope  string

@description('Policy  definition  ID  for  security  initiative')
param  securityInitiativeDefinitionId  string

resource  securityBaseline  'Microsoft.Authorization/policyAssignments@2022-06-01'  =  {
    name:  'security-baseline'
    scope:  assignmentScope
    properties:  {
        displayName:  'Security  Baseline  -  Enterprise  Landing  Zone'
        policyDefinitionId:  securityInitiativeDefinitionId
        enforcementMode:  'Default'
    }
}
