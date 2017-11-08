@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion
Reg delete HKCR\Directory\shell\git_gui  /f
Reg delete HKCR\Directory\Background\shell\git_gui  /f
Reg delete HKCR\Drive\shell\git_gui  /f
Reg delete HKCR\Directory\LibraryFolder\background\shell\git_gui  /f
Reg delete HKCR\Directory\shell\git_shell  /f
Reg delete HKCR\Directory\Background\shell\git_shell  /f
Reg delete HKCR\Drive\shell\git_shell  /f
Reg delete HKCR\Directory\LibraryFolder\background\shell\git_shell  /f
pause
