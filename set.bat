@echo off
set "target=%TEMP%\MyPenTest"
set "pdfurl=https://github.com/bhekinko/test/dummy.pdf"
set "pdflocal=%target%\dummy.pdf"

mkdir "%target%" >nul 2>&1
powershell -Command "Invoke-WebRequest -Uri '%pdfurl%' -OutFile '%pdflocal%'"
start "" "%pdflocal%"

