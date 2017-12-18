@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion
set fuck=Android SDK Tools
Reg add "HKLM\SOFTWARE\WOW6432Node\Android SDK Tools" /v "Path" /t REG_SZ /d "Z:\Android\Sdk" /f
Reg add HKLM\SOFTWARE\WOW6432Node\!fuck! /v "Path" /t REG_SZ /d "sdk" /f
Reg add HKLM\SOFTWARE\WOW6432Node /v "Android SDK Tools" /t REG_SZ /d "sdk" /f
Reg add HKLM\SOFTWARE\WOW6432Node\%fuck% /v "Path" /t REG_SZ /d "sdk" /f
pause
