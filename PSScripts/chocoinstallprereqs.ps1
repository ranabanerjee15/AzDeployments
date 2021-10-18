#Install Choco
#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install .Net 4.8
choco install dotnetfx --y

#Install Visual C++ Redistributable Package for Visual Studio 2012
choco install vcredist2017 --y

#Install Visual C++ Redistributable Package for Visual Studio 2013
choco install msvisualcplusplus2013-redist --y

#Install Unified Communications Managed API 4.0
choco install ucma4 --y

#Install URL Rewrite
choco install urlrewrite --y

#Install Chrome
choco install chrome-remote-desktop-chrome --y

#Install Notepad++
choco install notepadplusplus --y

#Install 7 Zip
choco install 7zip.install --y

#Install Edge
choco install microsoft-edge --y

#Install package provider
Install-PackageProvider -Name NuGet -Scope AllUsers -Force -Confirm:$false -Verbose

#install Required PS Modules
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

#Download and Mount Exchange ISO Image
$url = 'https://download.microsoft.com/download/5/3/e/53e75dbd-ca33-496a-bd23-1d861feaa02a/ExchangeServer2019-x64-CU11.ISO'
$dst = 'C:\temp\Ex2019.ISO'
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $dst)
Mount-DiskImage $dst -Confirm:$false

#Reboots Computer
Restart-Computer -Force