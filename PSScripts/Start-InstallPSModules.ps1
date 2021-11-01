#Install Modules
Install-PackageProvider -Name NuGet -Scope AllUsers -Force -Confirm:$false -Verbose
$modules = @(
    'ExchangeOnlineManagement'
    'ImportExcel'
    'Az'
    'AzureAdPreview'
    'MsOnline'
)

$modules | ForEach-Object {
    Install-Module -Name $_ -Scope AllUsers -AllowClobber -Force -Confirm:$false -ErrorAction SilentlyContinue
}