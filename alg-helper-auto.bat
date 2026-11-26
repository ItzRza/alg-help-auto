@echo off
setlocal
title AlgHelper Auto (1 istifadelik)
set "URL=https://cdn.jsdelivr.net/gh/ItzRza/alg-helper@4eab0b1/inject.js"
set "DEST=%TEMP%\alg_inject.js"
where node >nul 2>&1
if errorlevel 1 (
  echo XETA: Node.js tapilmadi. https://nodejs.org-dan yukleyin.
  pause
  exit /b 1
)
echo inject.js yuklenir...
powershell -NoProfile -ExecutionPolicy Bypass -Command "try{Invoke-WebRequest -UseBasicParsing '%URL%' -OutFile '%DEST%'}catch{Write-Host ('ERR: ' + $_.Exception.Message); exit 1}"
if errorlevel 1 (
  echo XETA: inject.js yuklenmedi.
  pause
  exit /b 1
)
node "%DEST%"
del "%DEST%" >nul 2>&1
echo.
echo Bitdi. Bu fayl silinir...
timeout /t 3 >nul
(goto) 2>nul & del "%~f0"
