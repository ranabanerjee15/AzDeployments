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