@echo off
cls
setlocal EnableDelayedExpansion
echo �����������ص���ҳ......
set /p URL=""
echo ȷ�����ص�ַ %URL%
you-get.exe -x 127.0.0.1:1080 -i "%URL%"
pause