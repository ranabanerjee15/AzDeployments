#install Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Chrome
choco install chrome-remote-desktop-chrome --y

#Install Notepad++
choco install notepadplusplus --y

#Install 7 Zip
choco install 7zip.install --y

#Install Edge
choco install microsoft-edge --y

#install dot net framework  4.8
choco install dotnetfx --y

#Install URL Rewrite
choco install urlrewrite --y

#Download and Mount Exchange ISO Image
$url = 'https://download.microsoft.com/download/5/3/e/53e75dbd-ca33-496a-bd23-1d861feaa02a/ExchangeServer2019-x64-CU11.ISO'
$dst = 'C:\temp\Ex2019.ISO'
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $dst)
Mount-DiskImage $dst

#Reboots Computer
Restart-Computer -Force