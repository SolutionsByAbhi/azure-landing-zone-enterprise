@description('Location  for  spoke  VNet')
param  location  string  =  'westeurope'

@description('Spoke  VNet  name')
param  spokeVnetName  string  =  'vnet-spoke-app'

@description('Spoke  address  space')
param  spokeAddressSpace  array  =  [
    '10.10.0.0/16'
]

@description('App  subnet  CIDR')
param  appSubnetCidr  string  =  '10.10.1.0/24'

resource  spokeVnet  'Microsoft.Network/virtualNetworks@2023-04-01'  =  {
    name:  spokeVnetName
    location:  location
    properties:  {
        addressSpace:  {
            addressPrefixes:  spokeAddressSpace
        }
        subnets:  [
            {
                name:  'snet-app'
                properties:  {
                    addressPrefix:  appSubnetCidr
                }
            }
        ]
    }
}

output  spokeVnetId  string  =  spokeVnet.id
output  appSubnetId  string  =  spokeVnet.properties.subnets[0].id
