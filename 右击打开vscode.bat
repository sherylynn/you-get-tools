@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion
Reg add HKCR\Directory\shell\VscodeHere /ve /t REG_SZ /d "open in vscode" /f
Reg add HKCR\Directory\shell\VscodeHere /v "Icon" /t REG_SZ /d "C:\Program Files\Microsoft VS Code\Code.exe" /f
Reg add HKCR\Directory\shell\VscodeHere\command /ve /t REG_SZ /d "C:\Program Files\Microsoft VS Code\Code.exe %%V" /f

Reg add HKCR\Directory\Background\shell\VscodeHere /ve /t REG_SZ /d "open in vscode" /f
Reg add HKCR\Directory\Background\shell\VscodeHere /v "Icon" /t REG_SZ /d "C:\Program Files\Microsoft VS Code\Code.exe" /f
Reg add HKCR\Directory\Background\shell\VscodeHere\command /ve /t REG_SZ /d "C:\Program Files\Microsoft VS Code\Code.exe %%V" /f

Reg add HKCR\Drive\shell\VscodeHere /ve /t REG_SZ /d "open in vscode" /f
Reg add HKCR\Drive\shell\VscodeHere /v "Icon" /t REG_SZ /d "C:\Program Files\Microsoft VS Code\Code.exe" /f
Reg add HKCR\Drive\shell\VscodeHere\command /ve /t REG_SZ /d "C:\Program Files\Microsoft VS Code\Code.exe %%V" /f

Reg add HKCR\Directory\LibraryFolder\background\shell\VscodeHere /ve /t REG_SZ /d "open in vscode" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\VscodeHere /v "Icon" /t REG_SZ /d "C:\Program Files\Microsoft VS Code\Code.exe" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\VscodeHere\command /ve /t REG_SZ /d "C:\Program Files\Microsoft VS Code\Code.exe %%V" /f

pause
