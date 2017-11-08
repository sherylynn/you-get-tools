@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion
rem reg /v 后是项目名称 /ve 是默认
rem %~fs0是执行文件 %~dp0是文件夹
rem cmd /k 是不提示版本号
Reg add HKCR\Directory\shell\OpenCmdHere /ve /t REG_SZ /d "open in cmd" /f
Reg add HKCR\Directory\shell\OpenCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\shell\OpenCmdHere\command /ve /t REG_SZ /d "cmd.exe" /f

Reg add HKCR\Directory\Background\shell\OpenCmdHere /ve /t REG_SZ /d "open in cmd" /f
Reg add HKCR\Directory\Background\shell\OpenCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\Background\shell\OpenCmdHere\command /ve /t REG_SZ /d "cmd.exe" /f

Reg add HKCR\Drive\shell\OpenCmdHere /ve /t REG_SZ /d "open in cmd" /f
Reg add HKCR\Drive\shell\OpenCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Drive\shell\OpenCmdHere\command /ve /t REG_SZ /d "cmd.exe" /f

Reg add HKCR\Directory\LibraryFolder\background\shell\OpenCmdHere /ve /t REG_SZ /d "open in cmd" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\OpenCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\OpenCmdHere\command /ve /t REG_SZ /d "cmd.exe" /f

echo test
pause
