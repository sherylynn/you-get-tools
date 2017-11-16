@echo off
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"
@echo off
cls
setlocal EnableDelayedExpansion

set VSCODE_VERSION=1.18.0
set NODE_VERSION=9.1.0
set GIT_VERSION=2.15.0
set PYTHON2_VERSION=2.7.14


set EXE=X:
set STORE=E:
set EXE_HOME=!EXE!\TDDownload\exe
set STUDIO_HOME=!DATA!\android-studio
set ANDROID_HOME=!DATA!\Android\Sdk
set PYTHON_HOME=C:\Python27

echo �ж��Ƿ�64λϵͳ
  if exist "%windir%\SysWOW64" (
    echo ϵͳΪ64λ set�в���ð�Ż�����ųԵ�
    set ProgramFiles_x86="%ProgramFiles(x86)%"
    set Framework64=Framework64
    set bit=64
    set xbit=64
    set vsbit=x64
    set pybit=.amd64
  )
  if NOT exist "%windir%\SysWOW64" (
    echo ϵͳ��32λ
    set ProgramFiles_x86=%ProgramFiles%
    set Framework64=Framework
    set bit=32
    set xbit=86
    set vsbit=ia32
    set pybit=
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

echo nodejs ȫ�ְ��趨
pause
start /WAIT /min cmd /c npm config set prefix "%USERPROFILE%\node-global"
start /WAIT /min cmd /c npm config set cache "%USERPROFILE%\node-cache"
start /WAIT /min cmd /c npm config set python C:\Python27\python.exe
start /WAIT /min cmd /c yarn config set cache-folder "%USERPROFILE%\yarn-cache"


echo 5
IF NOT EXIST "C:\Python27\python.exe" (
  start /WAIT wget https://www.python.org/ftp/python/!PYTHON2_VERSION!/python-!PYTHON2_VERSION!!pybit!.msi
  msiexec /i python-!PYTHON2_VERSION!!pybit!.msi /qn REBOOT=Suppress
)
echo 6
IF NOT EXIST "%ProgramFiles%\Git\git-bash.exe" (
  start /WAIT wget https://npm.taobao.org/mirrors/git-for-windows/v!GIT_VERSION!.windows.1/Git-!GIT_VERSION!-!bit!-bit.exe
  start /WAIT Git-!GIT_VERSION!-!bit!-bit.exe /sp- /silent /norestart
  echo ��װ��� git
)

echo ��ʼ���ÿ������� �� ��������
pause
IF EXIST "!STUDIO_HOME!\jre\bin\java.exe" (
echo. �ҵ�android-studio,��ʹ�ü��ɵ�jdk,ע�ỷ�������밴�����
echo. �˳�ֱ�ӹر�
pause
goto SETENV
)

:SETENV
set JAVA_HOME=!STUDIO_HOME!\jre
set GIT_HOME=%ProgramFiles%\Git
setx ANDROID_HOME !DATA!\Android\Sdk
setx JAVA_HOME !STUDIO_HOME!\jre
setx CLASSPATH .;!JAVA_HOME!\lib\tools.jar;!JAVA_HOME!\lib\dt.jar;!JAVA_HOME!\jre\lib\rt.jar
setx PATH "!PYTHON_HOME!\Scripts;!PYTHON_HOME!;%USERPROFILE%\Anaconda2;%USERPROFILE%\Anaconda2\Scripts;%USERPROFILE%\Anaconda2\Library\bin;!ANDROID_HOME!\tools;!ANDROID_HOME!\platform-tools;!STUDIO_HOME!\bin;!JAVA_HOME!\bin;!GIT_HOME!\cmd;!GIT_HOME!\mingw64\bin;!GIT_HOME!\usr\bin;%USERPROFILE%\AppData\Local\Microsoft\WindowsApps;%USERPROFILE%\AppData\Local\atom\bin;%APPDATA%\npm;%USERPROFILE%\node-global;%APPDATA%\Local\Yarn\.bin;D:\Bak\SS-KCPortable"

echo nodejs ȫ�ְ��趨
pause
start /WAIT /min cmd /c npm config set prefix "%USERPROFILE%\node-global"
start /WAIT /min cmd /c npm config set cache "%USERPROFILE%\node-cache"
start /WAIT /min cmd /c npm config set python C:\Python27\python.exe
start /WAIT /min cmd /c yarn config set cache-folder "%USERPROFILE%\yarn-cache"

echo npm yrman ��ַ�趨
start /WAIT /min cmd /c yrman use taobao
pause
echo ��Ҫ��ʼ����nodejs���� �Ƿ�Ҫ������
pause
IF NOT EXIST "%APPDATA%\npm\pouchdb-server.cmd" (
npm config set registry https://registry.npm.taobao.org --global
npm config set disturl https://npm.taobao.org/dist --global
npm config set python C:\Python27\python.exe --global
echo npm config set cafile C:\\Users\\lynn\\CA.crt
npm config set msvs_version 2015 --global
npm i -g --production windows-build-tools
npm i  -g react-native-cli rnpm pm2 pouchdb-server npm webpack yrm http-server j json dva-cli babel-cli code-push express-cli flow-bin vue-cli rundev eslint typescript cordova tslint ts-node node-gyp
)
pause
pause