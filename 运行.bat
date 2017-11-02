@echo off
cls
setlocal EnableDelayedExpansion
echo 输入你想下载的网页......
set /p URL=""
echo 确认下载地址 %URL%
you-get.exe -x 127.0.0.1:1080 -i "%URL%"
pause