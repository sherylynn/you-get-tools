@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion

set VSCODE_VERSION=1.18.0
set NODE_VERSION=9.1.0
set GIT_VERSION=2.15.0
echo �ж��Ƿ�64λϵͳ
  if exist "%windir%\SysWOW64" (
    echo ϵͳΪ64λ set�в���ð�Ż�����ųԵ�
    set ProgramFiles_x86="%ProgramFiles(x86)%"
    set Framework64=Framework64
    set bit=64
    set xbit=64
    set vsbit=x64
  )
  if NOT exist "%windir%\SysWOW64" (
    echo ϵͳ��32λ
    set ProgramFiles_x86=%ProgramFiles%
    set Framework64=Framework
    set bit=32
    set xbit=86
    set vsbit=ia32
  )
echo 1
if exist "%windir%\SysWOW64" (
    IF NOT EXIST "%ProgramFiles%\Microsoft VS Code\Code.exe" (
      start /WAIT wget https://go.microsoft.com/fwlink/?Linkid=852157 -O VSCodeSetup-!vsbit!-!VSCODE_VERSION!.exe
      start /WAIT VSCodeSetup-!vsbit!-!VSCODE_VERSION!.exe /sp- /silent /norestart /v /qn
      echo ��װ��� vscode
    )
  )
  if NOT exist "%windir%\SysWOW64" (
    IF NOT EXIST "!ProgramFiles_x86!\Microsoft VS Code\Code.exe" (
      start /WAIT wget https://go.microsoft.com/fwlink/?LinkID=623230 -O VSCodeSetup-!vsbit!-!VSCODE_VERSION!.exe
      start /WAIT VSCodeSetup-!vsbit!-!VSCODE_VERSION!.exe /sp- /silent /norestart /v /qn
      echo ��װ��� vscode
    )
  )
echo 2
IF NOT EXIST "%ProgramFiles%\nodejs\node.exe" (
  start /WAIT wget http://nodejs.org/dist/v!NODE_VERSION!/node-v!NODE_VERSION!-x!xbit!.msi
  msiexec /i node-v!NODE_VERSION!-x!xbit!.msi /qn REBOOT=Suppress
)
echo 6
IF NOT EXIST "%ProgramFiles%\Git\git-bash.exe" (
  start /WAIT wget https://npm.taobao.org/mirrors/git-for-windows/v!GIT_VERSION!.windows.1/Git-!GIT_VERSION!-!bit!-bit.exe
  start /WAIT Git-!GIT_VERSION!-!bit!-bit.exe /sp- /silent /norestart
  echo ��װ��� git
)
pause