param(
    [Parameter(Mandatory  =  $true)]
    [string]$RootManagementGroupId,
    [string]$MgPrefix  =  "corp"
)

Write-Host  "Bootstrapping  management  groups..."  -ForegroundColor  Cyan

az  deployment  tenant  create  `
    --name  "mg-bootstrap"  `
    --template-file  "./platform/management-groups/main.bicep"  `
    --parameters  rootManagementGroupId=$RootManagementGroupId  mgPrefix=$MgPrefix
