@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

cd "C:\Program Files\"
if exist Games\ (
  goto check1
) else (
  echo Game is not installed. Checking other locations.
  goto check2
)
:check1
cd Games
if exist Arcade-Game\ (
  rmdir Arcade-Game /Q /S
  goto check2
) else (
  goto check2
)
:check2
cd "C:\Program Files (x86)\Common Files"
if exist Enterbrain\ (
  rmdir Enterbrain /Q /S
  goto check3
) else (
  goto check3
)
:check3
cd C:\Windows\System32
if exist RGSS100J.dll (
  del RGSS100J.dll /Q /F
  del RGSS102E.dll /Q /F
  del RGSS102J.dll /Q /F
  del RGSS103J.dll /Q /F
  del RGSS104E.dll /Q /F
  del RGSS104J.dll /Q /F
) else (
  goto check4
)
:check4
cd C:\ProgramData\Microsoft\Windows\Start Menu\Programs
if exist Arcade-Game.lnk (
  del Arcade-Game.lnk
  del "%userprofile%\Desktop\Arcade Game.lnk"
  goto end
) else (
  goto end
)
:end
echo Successfully uninstalled!
pause