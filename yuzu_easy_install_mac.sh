#!/usr/bin/bash
clear
menu=""
while [[$menu!="n"]]||[[$menu!="y"]] do
	echo -n "Do you want to update this script? (y/n): "
	read -n 1 menu
done
if [[$menu=="y"]]; then
 	clear
	echo "Updating. Will close after update."
	update.bat

':A
set /p menu="Do you want to install Yuzu? (Y/N/System Archives/Cancel): "
if %menu%==Y goto Yes
if %menu%==y goto Yes
if %menu%==Yes goto Yes
if %menu%==yes goto Yes
if %menu%==N goto No
if %menu%==n goto No
if %menu%==No goto No
if %menu%==no goto No
if %menu%==C goto C
if %menu%==c goto C
if %menu%==Cancel goto C
if %menu%==cancel goto C
if %menu%==System Archives goto SA
if %menu%==SA goto SA
if %menu%==system archives goto SA
if %menu%==sa goto SA
cls
set /p pause="Press any key to continue!... "

:Yes
cls
echo.
echo This will download the Yuzu installer, and run it. Allow it to install.
echo.
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/4vdziiwebovju8x/yuzu_install.exe?dl=1', 'yuzu_install.exe')
echo We will now install yuzu, then delete the installer.
yuzu_install.exe
del yuzu_install.exe
del yuzu_installer.log
echo Done.
pause

:No
cls
echo Okay, that means it's time to download the keys.
echo.
echo We will now download the keys.
cd %appdata%\yuzu
mkdir keys
cd keys
echo Writing keys to %appdata%\yuzu\keys
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://s.hipeopeodev.us/prod.keys', 'prod.keys')
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://s.hipeopeodev.us/title.keys', 'title.keys')
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://s.hipeopeodev.us/shared_font.bin', 'shared_font.bin')
pause

:SA
echo.
echo We will now download the System Archives. This may take a while, it will be blank, but let it run.
cd %appdata%\yuzu\nand\system
powershell.exe (new-object System.Net.WebClient).DownloadFile('https://www.dropbox.com/s/0gwmpgus9t4q1dm/System_Archives.zip?dl=1', 'System_Archives.zip')
echo unzipping System Archives.
powershell.exe (new-object System.Net.WebClient).DownloadFile('http://stahlworks.com/dev/unzip.exe', 'unzip.exe')
unzip.exe System_Archives.zip
echo Writing System Archives to %appdata%\yuzu\keys\nand\system
del System_Archives.zip
del unzip.exe
pause

:C
cls
echo Thanks to /u/yuzu_pirate, /u/Azurime, and /u/bbb651 for their contributions to /r/YuzuP I R A C Y.
echo.
echo This program made by /u/Hipeopeo.
echo.
echo Thanks to the yuzu devs for making Yuzu!
pause
'
