@echo off
cls
setlocal EnableDelayedExpansion
echo %1
set url=%1
rem echo dev
set env=C:\Users\lynn\Downloads\you-get
rem set env=%AppData%\..\Local\Google\Chrome\User Data\Default\Extensions\iealjklbjaieahkhjemfjfggdcghmhad\1.0_0
set DownPath=%USERPROFILE%\Downloads
if %url:~0,11% EQU "youget://" (
    echo link from chrome
    set url=%url:~11,-1%
  )

set proxy="127.0.0.1:1080"
set path=%path%;%env%
set path=%path%;%env%\deps\ffmpeg\bin
set path=%path%;%env%\deps\rtmpdump
for /f "tokens=2,3 skip=3 delims= " %%a in ('you-get -x %proxy% -i %url%') do (
  echo %%a
  if %%a EQU itag: (
    set itag= %%b
    echo skip 4 line ,break_loop when first loop 
    goto :YouGetGet
  )
)

rem echo 没考虑到有些youtube没有title 不能直接skip 4行
rem for /f "tokens=3 skip=4 delims= " %%a in ('you-get -x %proxy% -i %url') do (
rem   set itag= %%a
rem   echo skip 4 line ,break_loop when first loop 
rem   goto :YouGetGet
rem )

:YouGetGet
echo %itag% top itag is bigest not default in you-get readme
you-get -x %proxy% --itag %itag% -o %DownPath%  %url%
pause