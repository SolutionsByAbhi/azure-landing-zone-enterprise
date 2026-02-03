param(
    [Parameter(Mandatory  =  $true)]
    [string]$SubscriptionId,
    [string]$Location  =  "westeurope"
)

Write-Host  "Setting  subscription  context..."  -ForegroundColor  Cyan
az  account  set  --subscription  $SubscriptionId

Write-Host  "Deploying  logging  &  monitoring..."  -ForegroundColor  Cyan
az  deployment  sub  create  `
    --location  $Location  `
    --template-file  "./platform/logging-monitoring/log-analytics.bicep"

Write-Host  "Deploying  hub  network..."  -ForegroundColor  Cyan
az  deployment  sub  create  `
    --location  $Location  `
    --template-file  "./platform/networking/hub/hub-vnet.bicep"
