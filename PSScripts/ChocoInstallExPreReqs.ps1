Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install .Net 4.8
choco install dotnetfx --y

#Install Visual C++ Redistributable Package for Visual Studio 2012
choco install vcredist2017 --y

#Install Visual C++ Redistributable Package for Visual Studio 2013
choco install msvisualcplusplus2013-redist --y

#Install Unified Communications Managed API 4.0
choco install ucma4 --y

#Install Chrome
choco install chrome-remote-desktop-chrome --y

#Install Notepad++
choco install notepadplusplus --y

#Install 7 Zip
choco install 7zip.install --y
