Set-ExecutionPolicy Unrestricted 

 $TerraformDestination="$((New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path) + terraform.zip"                                                                                        

Start-BitsTransfer -Source 'https://releases.hashicorp.com/terraform/1.3.2/terraform_1.3.2_windows_386.zip' -Destination $TerraformDestination

 $MongoshDestination="$((New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path) + mongosh.msi"     

Start-BitsTransfer -Source 'https://downloads.mongodb.com/compass/mongosh-1.6.0-x64.msi?_ga=2.153152699.2061862758.1666074328-318488355.1664437022' -Destination $MongoshDestination


$MongoCompassDestination="$((New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path) + mongocompass.msi"     

Start-BitsTransfer -Source 'https://downloads.mongodb.com/compass/mongosh-1.6.0-x64.msi?_ga=2.153152699.2061862758.1666074328-318488355.1664437022' -Destination $MongoCompassDestination

Invoke-CimMethod -ClassName Win32_Product -MethodName Install -Arguments @{PackageLocation=$MongoCompassDestination}

Invoke-CimMethod -ClassName Win32_Product -MethodName Install -Arguments @{PackageLocation=$MongoshDestination}


Expand-Archive  $TerraformDestination  -DestinationPath "$((New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path) + \terraform" 

