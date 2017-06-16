# problem statement
creates an azure vm (if it doesn't already exist)

# example usage

> note: in examples, VERSION represents a version of the azure.vm.create pkg

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.vm.create#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.vm.create#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.vm.create#VERSION }
    inputs: 
      subscriptionId:
      loginId:
      loginSecret:
      name:
      resourceGroup:
      adminUsername:
      # begin optional args
      adminPassword:
      dataDisks:
      osDisk:
      authenticationType:
      availabilitySet:
      customData:
      dataDiskCaching:
      dataDiskSizes:
      generateSshKeys:
      image:
      licenseType:
      location:
      nics:
      nsg:
      nsgRule:
      osDiskCaching:
      osDiskName:
      osType:
      privateIpAddress:
      publicIpAddress:
      publicIpAddressAllocation:
      publicIpAddressDnsName:
      size:
      sshKeyPath:
      sshKeyValue:
      storageAccount:
      storageContainerName:
      storageSku:
      subnet:
      subnetAddressPrefix:
      tags:
      isManagedDisk:
      vnetAddressPrefix:
      vnet:
      loginTenantId:
      loginType:
      # end optional args
```

