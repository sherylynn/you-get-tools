@echo off
cls
setlocal EnableDelayedExpansion
set DATA=%~d0
rem: 根目录只用跳过5个
for /f "tokens=3-6 skip=5 delims= " %%a in ('dir !DATA!\') do (
  if not "%%a"=="<DIR>" if not "%%b"=="字节" if not "%%b"=="可用字节" (
    echo 文件
  )
  if "%%a"=="<DIR>" if not "%%b"== "Documents" if not "%%b"=="Downloads" if not "%%b"=="AppData" (
    if exist "!DATA!\%%b\.sync\Archive" (
      rd /s /Q !DATA!\%%b\.sync\Archive
      md !DATA!\%%b\.sync\Archive
    )
  )
)


