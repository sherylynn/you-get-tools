@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off & title ��װ�Զ�����ֽ
cls
setlocal EnableDelayedExpansion

Reg add HKCR\Directory\shell\downloadimg /ve /t REG_SZ /d "�л���ֽ" /f
Reg add HKCR\Directory\shell\downloadimg /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\shell\downloadimg\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/c %~dp0downloads.bat \",\"\",\"\",0)(window.close)"  /f

Reg add HKCR\Directory\Background\shell\downloadimg /ve /t REG_SZ /d "�л���ֽ" /f
Reg add HKCR\Directory\Background\shell\downloadimg /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\Background\shell\downloadimg\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/c %~dp0downloads.bat \",\"\",\"\",0)(window.close)"  /f

Reg add HKCR\Drive\shell\downloadimg /ve /t REG_SZ /d "�л���ֽ" /f
Reg add HKCR\Drive\shell\downloadimg /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Drive\shell\downloadimg\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/c %~dp0downloads.bat \",\"\",\"\",0)(window.close)"  /f

Reg add HKCR\Directory\LibraryFolder\background\shell\downloadimg /ve /t REG_SZ /d "�л���ֽ" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\downloadimg /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\downloadimg\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/c %~dp0downloads.bat \",\"\",\"\",0)(window.close)"  /f

