param (
    [Parameter(Mandatory = $true)]
    [string]       $ResourceGroupName,
    [string]       $ResourceLocation = "eastus2"
)  

$opts = @{
    Name                  = ("Deployment-{0}-{1}" -f $ResourceGroupName, $(Get-Date).ToString("yyyyMMddhhmmss"))
    ResourceGroupName     = $ResourceGroupName
    TemplateFile          = (Join-Path -Path $PWD.Path -ChildPath "template.json")
    TemplateParameterFile = (Join-Path -Path $PWD.Path -ChildPath "parameters.json")
    adminPassword         = (Read-Host -Prompt "Enter an administrator password for the VM" -AsSecureString)
}

New-AzResourcegroup -Name $ResourceGroupName -Location $ResourceLocation -Verbose
New-AzResourceGroupDeployment @opts -Verbose