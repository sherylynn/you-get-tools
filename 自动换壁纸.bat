@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off & title °²×°×Ô¶¯»»±ÚÖ½
cls
setlocal EnableDelayedExpansion

Reg add HKCR\Directory\shell\downloadimg /ve /t REG_SZ /d "ÇÐ»»±ÚÖ½" /f
Reg add HKCR\Directory\shell\downloadimg /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\shell\downloadimg\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/c %~dp0downloads.bat %%1\",\"\",\"\",0)(window.close)"  /f

Reg add HKCR\Directory\Background\shell\downloadimg /ve /t REG_SZ /d "ÇÐ»»±ÚÖ½" /f
Reg add HKCR\Directory\Background\shell\downloadimg /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\Background\shell\downloadimg\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/c %~dp0downloads.bat %%1\",\"\",\"\",0)(window.close)"  /f

Reg add HKCR\Drive\shell\downloadimg /ve /t REG_SZ /d "ÇÐ»»±ÚÖ½" /f
Reg add HKCR\Drive\shell\downloadimg /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Drive\shell\downloadimg\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/c %~dp0downloads.bat %%1\",\"\",\"\",0)(window.close)"  /f

Reg add HKCR\Directory\LibraryFolder\background\shell\downloadimg /ve /t REG_SZ /d "ÇÐ»»±ÚÖ½" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\downloadimg /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\downloadimg\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/c %~dp0downloads.bat %%1\",\"\",\"\",0)(window.close)"  /f

set Save=%USERPROFILE%\Pictures
set FileName=1000
set regadd=reg add "HKCU\Control Panel\Desktop"

%regadd% /v TileWallpaper /d "0" /f

%regadd% /v Wallpaper /d "%Save%\%FileName%.jpg" /f

%regadd% /v WallpaperStyle /d "10" /f

RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters

exit

