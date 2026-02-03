@description('Hub  VNet  ID')
param  hubVnetId  string

@description('Spoke  VNet  ID')
param  spokeVnetId  string

resource  hubToSpoke  'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01'  =  {
    name:  '${last(split(hubVnetId,  '/'))}/to-${last(split(spokeVnetId,  '/'))}'
    properties:  {
        remoteVirtualNetwork:  {
            id:  spokeVnetId
        }
        allowForwardedTraffic:  true
        allowVirtualNetworkAccess:  true
        allowGatewayTransit:  true
    }
}

resource  spokeToHub  'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01'  =  {
    name:  '${last(split(spokeVnetId,  '/'))}/to-${last(split(hubVnetId,  '/'))}'
    properties:  {
        remoteVirtualNetwork:  {
            id:  hubVnetId
        }
        allowForwardedTraffic:  true
        allowVirtualNetworkAccess:  true
        useRemoteGateways:  true
    }
}
