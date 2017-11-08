@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion

set NODE_VERSION=9.1.0

echo 判断是否64位系统
  if exist "%windir%\SysWOW64" (
    echo 系统为64位 set中不加冒号会把括号吃掉
    set ProgramFiles_x86="%ProgramFiles(x86)%"
    set Framework64=Framework64
    set bit=64
    set xbit=64
  )
  if NOT exist "%windir%\SysWOW64" (
    echo 系统是32位
    set ProgramFiles_x86=%ProgramFiles%
    set Framework64=Framework
    set bit=32
    set xbit=86
  )

echo 2
IF NOT EXIST "%ProgramFiles%\nodejs\node.exe" (
  start /WAIT wget http://nodejs.org/dist/v!NODE_VERSION!/node-v!NODE_VERSION!-x!xbit!.msi
  msiexec /i node-v!NODE_VERSION!-x!xbit!.msi /qn REBOOT=Suppress
)
echo 3 更新
  start /WAIT wget http://nodejs.org/dist/v!NODE_VERSION!/node-v!NODE_VERSION!-x!xbit!.msi
  msiexec /i node-v!NODE_VERSION!-x!xbit!.msi /qn REBOOT=Suppress
pause