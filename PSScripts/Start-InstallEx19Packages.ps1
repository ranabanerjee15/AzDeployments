#Install Choco
#Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Chrome
choco install chrome-remote-desktop-chrome --y

#Install Notepad++
choco install notepadplusplus --y

#Install 7 Zip
choco install 7zip.install --y

#Install Edge
choco install microsoft-edge --y

#Install .Net 4.8
choco install dotnetfx --y

#Install Visual C++ Redistributable Package for Visual Studio 2012
choco install vcredist2017 --y

#Install Visual C++ Redistributable Package for Visual Studio 2013
choco install msvisualcplusplus2013-redist --y

#Install Unified Communications Managed API 4.0
choco install ucma4 --y

#Install IIS URL Rewrite - Does not install under user context
#choco install urlrewrite --y

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

#Create Required Folders
$ExSetupDir = 'C:\ExSetup'
$TempDir = 'C:\Temp'
$ExISOPath = 'C:\Temp\Ex2019.ISO'
New-Item -Path $TempDir -ItemType Directory -Force
New-Item -Path $ExSetupDir -ItemType Directory -Force
 
#Download Ex2019 CU11 ISO
$url = 'https://download.microsoft.com/download/5/3/e/53e75dbd-ca33-496a-bd23-1d861feaa02a/ExchangeServer2019-x64-CU11.ISO'
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $ExISOPath)
#Mount-DiskImage $dst -Confirm:$false (not needed)

#Extract and Copy Setup Files to C:\Exsetup
$command = "7z x -y '$ExISOPath' -o'$ExSetupDir'"
Invoke-Expression $command