@description('Location  for  hub  VNet')
param  location  string  =  'westeurope'

@description('Hub  VNet  name')
param  hubVnetName  string  =  'vnet-hub'

@description('Hub  address  space')
param  hubAddressSpace  array  =  [
    '10.0.0.0/16'
]

@description('Shared  services  subnet  CIDR')
param  sharedServicesSubnetCidr  string  =  '10.0.1.0/24'

@description('Azure  Firewall  subnet  CIDR')
param  firewallSubnetCidr  string  =  '10.0.2.0/24'

resource  hubVnet  'Microsoft.Network/virtualNetworks@2023-04-01'  =  {
    name:  hubVnetName
    location:  location
    properties:  {
        addressSpace:  {
            addressPrefixes:  hubAddressSpace
        }
        subnets:  [
            {
                name:  'snet-shared-services'
                properties:  {
                    addressPrefix:  sharedServicesSubnetCidr
                }
            }
            {
                name:  'AzureFirewallSubnet'
                properties:  {
                    addressPrefix:  firewallSubnetCidr
                }
            }
        ]
    }
}

output  hubVnetId  string  =  hubVnet.id
output  sharedServicesSubnetId  string  =  hubVnet.properties.subnets[0].id
output  firewallSubnetId  string  =  hubVnet.properties.subnets[1].id
