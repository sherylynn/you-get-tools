@echo off
cls
setlocal EnableDelayedExpansion
set DATA=%~d0
rem: ��Ŀ¼ֻ������5��
for /f "tokens=3-6 skip=5 delims= " %%a in ('dir !DATA!\') do (
  if not "%%a"=="<DIR>" if not "%%b"=="�ֽ�" if not "%%b"=="�����ֽ�" (
    echo �ļ�
  )
  if "%%a"=="<DIR>" if not "%%b"== "Documents" if not "%%b"=="Downloads" if not "%%b"=="AppData" (
    if exist "!DATA!\%%b\.sync\Archive" (
      rd /s /Q !DATA!\%%b\.sync\Archive
      md !DATA!\%%b\.sync\Archive
    )
  )
)


