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
set DATA=Z:
set STORE=E:
set EXE_HOME=!EXE!\TDDownload\exe
set STUDIO_HOME=!DATA!\android-studio
set ANDROID_HOME=!DATA!\Android\Sdk
set PYTHON_HOME=C:\Python27

echo 判断是否64位系统
  if exist "%windir%\SysWOW64" (
    echo 系统为64位 set中不加冒号会把括号吃掉
    set ProgramFiles_x86="%ProgramFiles(x86)%"
    set Framework64=Framework64
    set bit=64
    set xbit=64
    set vsbit=x64
    set pybit=.amd64
  )
  if NOT exist "%windir%\SysWOW64" (
    echo 系统是32位
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
      echo 安装完毕 vscode
    )
  )
  if NOT exist "%windir%\SysWOW64" (
    IF NOT EXIST "!ProgramFiles_x86!\Microsoft VS Code\Code.exe" (
      start /WAIT wget https://go.microsoft.com/fwlink/?LinkID=623230 -O VSCodeSetup-!vsbit!-!VSCODE_VERSION!.exe
      start /WAIT VSCodeSetup-!vsbit!-!VSCODE_VERSION!.exe /sp- /silent /norestart /v /qn
      echo 安装完毕 vscode
    )
  )
echo 2
IF NOT EXIST "%ProgramFiles%\nodejs\node.exe" (
  start /WAIT wget http://nodejs.org/dist/v!NODE_VERSION!/node-v!NODE_VERSION!-x!xbit!.msi
  msiexec /i node-v!NODE_VERSION!-x!xbit!.msi /qn REBOOT=Suppress
)

echo nodejs 全局包设定
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
  echo 安装完毕 git
)

echo 开始设置开发环境 和 环境变量
pause
IF EXIST "!STUDIO_HOME!\jre\bin\java.exe" (
echo. 找到android-studio,将使用集成的jdk,注册环境变量请按任意键
echo. 退出直接关闭
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


echo 因为 delims用空格分隔 所以如果是带空格的文件夹会被直接切割掉 tokens 代表获取的第几个切割后的块,如果目录带空格,切割后影响很大
echo 解决了以往目录名中有空格的问题，默认兼容2个空格 3-6可以改，改了后还要改%%b %%c %%d 相应增加间的空格,利用windows新建文件夹不理睬后面的空格的功能来搞


for /f "tokens=3-6 skip=7 delims= " %%a in ('dir !DATA!\lynn\') do (
  if not "%%a"=="<DIR>" if not "%%b"=="字节" if not "%%b"=="可用字节" (
    del "%USERPROFILE%\%%b %%c %%d" /s /q
    mklink "%USERPROFILE%\%%b %%c %%d" "!DATA!\lynn\%%b %%c %%d"
  )
  if "%%a"=="<DIR>" if not "%%b"== "Documents" if not "%%b"=="Downloads" if not "%%b"=="AppData" (
    rmdir /s /q "%USERPROFILE%\%%b %%c %%d"
    rmdir /s /q "%USERPROFILE%\%%b"
    mklink /d "%USERPROFILE%\%%b %%c %%d" "!DATA!\lynn\%%b %%c %%d"
  )
)

echo 由于全部是目录,而且考虑到会有空格,本想用 for/d 来操作 但是这个方法获取的是全部路径,不方便删除c盘下的原文件
for /f "delims=" %%b in ('dir /b "!EXE!\Program Files (x86)\*"') do (
    rmdir "!ProgramFiles_x86!\%%b" /s /q
    mklink /d "!ProgramFiles_x86!\%%b" "!EXE!\Program Files (x86)\%%b"
)

echo 一部分程序数据
for /f "delims=" %%b in ('dir /b "!EXE!\Local\*"') do (
    rmdir "%AppData%\..\Local\%%b" /s /q
    mklink /d "%AppData%\..\Local\%%b" "!EXE!\Local\%%b"
)

del "%USERPROFILE%\CA.crt" /s /q
mklink "%USERPROFILE%\CA.crt" "!DATA!\lynn\XX-Net\data\gae_proxy\CA.crt"

rmdir "%USERPROFILE%\Documents\NetSarang" /s /q
mklink /d "%USERPROFILE%\Documents\NetSarang" "%USERPROFILE%\NetSarang"

del "%APPDATA%\Code\User\settings.json" /s /q
mklink "%APPDATA%\Code\User\settings.json" "!DATA!\lynn\settings.json"


echo nodejs 全局包设定
pause
start /WAIT /min cmd /c npm config set prefix "%USERPROFILE%\node-global"
start /WAIT /min cmd /c npm config set cache "%USERPROFILE%\node-cache"
start /WAIT /min cmd /c npm config set python C:\Python27\python.exe
start /WAIT /min cmd /c yarn config set cache-folder "%USERPROFILE%\yarn-cache"

echo npm yrman 地址设定
start /WAIT /min cmd /c yrman use taobao
pause
echo 将要开始布置nodejs环境 是否要继续？
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