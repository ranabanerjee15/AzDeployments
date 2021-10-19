#install Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Chrome
choco install chrome-remote-desktop-chrome --y

#Install Edge
choco install microsoft-edge --y

#Install Notepad++
choco install notepadplusplus --y

#Install 7 Zip
choco install 7zip.install --y

#Download ISO on DC (to save Time)
$dst = 'C:\temp\Ex2019.ISO'
mkdir $dst
$url = 'https://download.microsoft.com/download/5/3/e/53e75dbd-ca33-496a-bd23-1d861feaa02a/ExchangeServer2019-x64-CU11.ISO'
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $dst)
#Mount-DiskImage $dst -Confirm:$false (not needed)