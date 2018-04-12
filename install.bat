@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion
rem %~fs0是执行文件 %~dp0是文件夹
Reg delete HKCR\youget /f
Reg add HKCR\youget /ve /t REG_SZ /d "URL:youget Protocol Handler" /f
Reg add HKCR\youget /v "URL Protocol" /t REG_SZ /f
Reg add HKCR\youget\shell\open\command /ve  /t REG_SZ /d "%~dp0you-get-tools.bat \"%%1\"" /f
echo test
pause