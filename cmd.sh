#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

echo "checking for existing vm"
if [ "$(az vm show --resource-group "$resourceGroup" --name "$name")" != "" ]
then
  echo "found exiting vm"
else
  createCmd='az vm create'
  createCmd=$(printf "%s --name %s" "$createCmd" "$name")
  createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")
  createCmd=$(printf "%s --admin-username %s" "$createCmd" "$adminUsername")
  createCmd=$(printf "%s --public-ip-address-allocation %s" "$createCmd" "$publicIpAddressAllocation")
  createCmd=$(printf "%s --subnet-address-prefix %s" "$createCmd" "$subnetAddressPrefix")
  createCmd=$(printf "%s --tags %s" "$createCmd" "$tags")
  createCmd=$(printf "%s --vnet-address-prefix %s" "$createCmd" "$vnetAddressPrefix")


  # handle opts
  if [ "$adminPassword" != " " ]; then
  createCmd=$(printf "%s --admin-password %s" "$createCmd" "$adminPassword")
  fi

  if [ "$dataDisks" != " " ]; then
  createCmd=$(printf "%s --attach-data-disks %s" "$createCmd" "$dataDisk")
  fi

  if [ "$osDisk" != " " ]; then
  createCmd=$(printf "%s --attach-os-disk %s" "$createCmd" "$osDisk")
  fi

  if [ "$authenticationType" != " " ]; then
  createCmd=$(printf "%s --authentication-type %s" "$createCmd" "$authenticationType")
  fi

  if [ "$availabilitySet" != " " ]; then
  createCmd=$(printf "%s --availability-set %s" "$createCmd" "$availabilitySet")
  fi

  if [ "$customData" != " " ]; then
  createCmd=$(printf "%s --custom-data %s" "$createCmd" "$customData")
  fi

  if [ "$dataDiskCaching" != " " ]; then
  createCmd=$(printf "%s --data-disk-caching %s" "$createCmd" "$dataDiskCaching")
  fi

  if [ "$dataDiskSizes" != " " ]; then
  createCmd=$(printf "%s --data-disk-sizes %s" "$createCmd" "$dataDiskSizes")
  fi

  if [ "$generateSshKeys" == 'true' ]; then
  createCmd=$(printf "%s --generate-ssh-keys" "$createCmd")
  fi

  if [ "$image" != " " ]; then
  createCmd=$(printf "%s --image %s" "$createCmd" "$image")
  fi

  if [ "$licenseType" != " " ]; then
  createCmd=$(printf "%s --license-type %s" "$createCmd" "$licenseType")
  fi

  if [ "$location" != " " ]; then
  createCmd=$(printf "%s --location %s" "$createCmd" "$location")
  fi

  if [ "$nics" != " " ]; then
  createCmd=$(printf "%s --nics %s" "$createCmd" "$nics")
  fi

  if [ "$nsg" != " " ]; then
  createCmd=$(printf "%s --nsg %s" "$createCmd" "$nsg")
  fi

  if [ "$nsgRule" != " " ]; then
  createCmd=$(printf "%s --nsg-rule %s" "$createCmd" "$nsgRule")
  fi

  if [ "$osDiskCaching" != " " ]; then
  createCmd=$(printf "%s --os-disk-caching %s" "$createCmd" "$osDiskCaching")
  fi

  if [ "$osDiskName" != " " ]; then
  createCmd=$(printf "%s --os-disk-name %s" "$createCmd" "$osDiskName")
  fi

  if [ "$osType" != " " ]; then
  createCmd=$(printf "%s --os-type %s" "$createCmd" "$osType")
  fi

  if [ "$privateIpAddress" != "0.0.0.0" ]; then
  createCmd=$(printf "%s --private-ip-address %s" "$createCmd" "$privateIpAddress")
  fi

  if [ "$publicIpAddress" != " " ]; then
  createCmd=$(printf "%s --public-ip-address %s" "$createCmd" "$publicIpAddress")
  fi

  if [ "$publicIpAddressDnsName" != " " ]; then
  createCmd=$(printf "%s --public-ip-address-dns-name %s" "$createCmd" "$publicIpAddressDnsName")
  fi

  if [ "$size" != " " ]; then
  createCmd=$(printf "%s --size %s" "$createCmd" "$size")
  fi

  if [ "$sshKeyPath" != " " ]; then
  createCmd=$(printf "%s --ssh-dest-key-path %s" "$createCmd" "$sshKeyPath")
  fi

  if [ ! -s /sshKeyValue ]; then
  createCmd=$(printf "%s --ssh-key-value /sshKeyValue" "$createCmd")
  fi

  if [ "$storageAccount" != " " ]; then
  createCmd=$(printf "%s --storage-account %s" "$createCmd" "$storageAccount")
  fi

  if [ "$storageContainerName" != " " ]; then
  createCmd=$(printf "%s --storage-container-name %s" "$createCmd" "$storageContainerName")
  fi

  if [ "$storageSku" != " " ]; then
  createCmd=$(printf "%s --storage-sku %s" "$createCmd" "$storageSku")
  fi

  if [ "$subnet" != " " ]; then
  createCmd=$(printf "%s --subnet %s" "$createCmd" "$subnet")
  fi

  if [ "$isManagedDisk" != 'true' ]; then
  createCmd=$(printf "%s --use-unmanaged-disk" "$createCmd")
  fi

  if [ "$vnet" != " " ]; then
  createCmd=$(printf "%s --vnet-name %s" "$createCmd" "$vnet")
  fi

  echo "creating vm"
  eval "$createCmd"
fi
