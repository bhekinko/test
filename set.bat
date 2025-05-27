@echo off
set "FOLDER=%TEMP%\MySecretPDF"
set "PDFURL=https://faisalabad23.github.io/test/budget_2024-25.pdf"
set "TXTURL=https://raw.githubusercontent.com/dwyl/english-words/master/words_alpha.txt"
set "PDF=%FOLDER%\invoice.pdf"
set "TXT=%FOLDER%\words.txt"

mkdir "%FOLDER%" >nul 2>&1
curl -o "%PDF%" "%PDFURL%"
curl -o "%TXT%" "%TXTURL%"
start notepad.exe "%TXT%"
timeout /t 1 >nul
start "" "%PDF%"
