@echo off
cls
setlocal EnableDelayedExpansion

rem echo dev

set env=%~dp0
set path=%path%;%env%
set path=%path%;%env%\deps\ffmpeg\bin
set path=%path%;%env%\deps\rtmpdump
echo %1
set url=%1

set DownPath=%USERPROFILE%\Downloads
if %url:~1,9% EQU youget:// (
    echo link from chrome
    if %url:~10,1% EQU 1 (
      set proxy=-x "http://127.0.0.1:1082"
      set url=%url:~11,-1%
    )
    if %url:~10,1% EQU 0 (
      set proxy=
      set itag=
      set url=%url:~11,-1%
      goto :YouGetGet
    )
    
  )
::为了遍历结果，在url外包上了""，以前是在书签里直接传，现在是在代码里传
set url="!url!"
for /f "tokens=2,3 skip=3 delims= " %%a in ('you-get %proxy% -i %url%') do (
  echo %%a
  if %%a EQU itag: (
    set itag= --itag=%%b
    echo skip 4 line ,break_loop when first loop 
    goto :YouGetGet
  )
)

:YouGetGet
echo %itag% top itag is bigest not default in you-get readme
you-get %proxy% %itag% -o %DownPath%  %url%
pause
