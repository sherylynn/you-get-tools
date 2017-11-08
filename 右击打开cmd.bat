@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion

::reg /v 后是项目名称 /ve 是默认
::%~fs0是执行文件 %~dp0是文件夹
::cmd /k 是不提示版本号 且执行命令并继续

Reg add HKCR\Directory\shell\OpenCmdHere /ve /t REG_SZ /d "open in cmd" /f
Reg add HKCR\Directory\shell\OpenCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\shell\OpenCmdHere\command /ve /t REG_SZ /d "cmd.exe /k" /f

Reg add HKCR\Directory\Background\shell\OpenCmdHere /ve /t REG_SZ /d "open in cmd" /f
Reg add HKCR\Directory\Background\shell\OpenCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\Background\shell\OpenCmdHere\command /ve /t REG_SZ /d "cmd.exe /k" /f

Reg add HKCR\Drive\shell\OpenCmdHere /ve /t REG_SZ /d "open in cmd" /f
Reg add HKCR\Drive\shell\OpenCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Drive\shell\OpenCmdHere\command /ve /t REG_SZ /d "cmd.exe /k" /f

Reg add HKCR\Directory\LibraryFolder\background\shell\OpenCmdHere /ve /t REG_SZ /d "open in cmd" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\OpenCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\OpenCmdHere\command /ve /t REG_SZ /d "cmd.exe /k" /f
::pushd 是改变当前所在目录
::引号的转义是\ %的转义是%
::mshta vbscript是直接运行的，windows.close是关闭hta的窗口 /k是为了保证呼唤出来的cmd能运行
::mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/k pushd %%V","","runas",1)(window.close)
::mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/k pushd %%V\",\"\",\"runas\",1)(window.close)
Reg add HKCR\Directory\shell\OpenAdminCmdHere /ve /t REG_SZ /d "open in cmd as admin" /f
Reg add HKCR\Directory\shell\OpenAdminCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\shell\OpenAdminCmdHere\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/k pushd %%V\",\"\",\"runas\",1)(window.close)"  /f

Reg add HKCR\Directory\Background\shell\OpenAdminCmdHere /ve /t REG_SZ /d "open in cmd as admin" /f
Reg add HKCR\Directory\Background\shell\OpenAdminCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\Background\shell\OpenAdminCmdHere\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/k pushd %%V\",\"\",\"runas\",1)(window.close)"  /f

Reg add HKCR\Drive\shell\OpenAdminCmdHere /ve /t REG_SZ /d "open in cmd as admin" /f
Reg add HKCR\Drive\shell\OpenAdminCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Drive\shell\OpenAdminCmdHere\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/k pushd %%V\",\"\",\"runas\",1)(window.close)"  /f

Reg add HKCR\Directory\LibraryFolder\background\shell\OpenAdminCmdHere /ve /t REG_SZ /d "open in cmd as admin" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\OpenAdminCmdHere /v "Icon" /t REG_SZ /d "cmd.exe" /f
Reg add HKCR\Directory\LibraryFolder\background\shell\OpenAdminCmdHere\command /ve /t REG_SZ /d "mshta vbscript:CreateObject(\"Shell.Application\").ShellExecute(\"cmd.exe\",\"/k pushd %%V\",\"\",\"runas\",1)(window.close)"  /f

pause
