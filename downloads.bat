@echo off
cls
setlocal EnableDelayedExpansion
set Size=1000
set Url=http://picsum.photos/%Size%/?random
set Save=%USERPROFILE%\Pictures

for %%a in ("%Url%") do set "FileName=%%~nxa"
if not defined Save set "Save=%cd%"
(echo Download Wscript.Arguments^(0^),Wscript.Arguments^(1^)
echo Sub Download^(url,target^)
echo   Const adTypeBinary = 1
echo   Const adSaveCreateOverWrite = 2
echo   Dim http,ado
echo   Set http = CreateObject^("Msxml2.ServerXMLHTTP"^)
echo   http.open "GET",url,False
echo   http.send
echo   Set ado = createobject^("Adodb.Stream"^)
echo   ado.Type = adTypeBinary
echo   ado.Open
echo   ado.Write http.responseBody
echo   ado.SaveToFile target
echo   ado.Close
echo End Sub)>%Save%\DownloadFile.vbs


set id=%random%

:: del %Save%\%FileName%.jpg
%Save%\DownloadFile.vbs "%Url%" "%Save%\%id%.jpg"
:: del %Save%\1000.jpg
:: %Save%\DownloadFile.vbs "%Url%" "%Save%\1000.jpg"
del %Save%\DownloadFile.vbs
:: set regadd=reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System"
set regadd=reg add "HKCU\Control Panel\Desktop"
%regadd% /v TileWallpaper /d "0" /f
%regadd% /v Wallpaper /d "%Save%\%id%.jpg" /f
%regadd% /v WallpaperStyle /d "10" /f

RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
:: 微软注册表功能限制，没法直接生效
:: RUNDLL32.EXE user32.dll, SystemParametersInfo(20,0,"C:\Users\lynn\Pictures\12771,jpg",0x2)
:: rundll32 并不能call所有的dll,只有早期的有，后期的很多都不是为了rundll设计的，官网有设置墙纸的api，有powershell的，但是和rundll已经关联不多了
