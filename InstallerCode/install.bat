@echo off
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

cd "C:\Program Files\"
if exist Games\ (
  BREAK
) else (
  mkdir Games
)
cd Games
if exist Arcade-Game\ (
  rmdir Arcade-Game /Q /S
  mkdir Arcade-Game
  goto RGSS
) else (
  mkdir Arcade-Game
  goto RGSS
)
:RGSS
cd "C:\Program Files (x86)\Common Files"
if exist Enterbrain\ (
  rmdir Enterbrain /Q /S
  goto RGSS
) else (
  mkdir Enterbrain
  cd Enterbrain
  mkdir RGSS
  cd RGSS
  mkdir Standard
  goto install
)
:install
cd "C:\Program Files\Games\Arcade-Game"
powershell Invoke-RestMethod -Uri https://dl.degica.com/rpgmakerweb/run-time-packages/xp_rtp104e.exe -Method "GET" -Outfile xp.exe
powershell Invoke-RestMethod -Uri https://github.com/TheBetaBiggie/proxyconf/raw/main/innounp.exe -Method "GET" -OutFile innounp.exe
mkdir temp
move innounp.exe temp/
move xp.exe temp/
cd temp/
mkdir install
innounp -x -y -b -dinstall xp.exe
cd install
cd {app}
move Audio "C:\Program Files (x86)\Common Files\Enterbrain\RGSS\Standard"
move Graphics "C:\Program Files (x86)\Common Files\Enterbrain\RGSS\Standard"
move Game.ico "C:\Program Files (x86)\Common Files\Enterbrain\RGSS\Standard"
cd ..
cd {sys}
move RGSS100J.dll C:\Windows\System32
move RGSS102E.dll C:\Windows\System32
move RGSS102J.dll C:\Windows\System32
move RGSS103J.dll C:\Windows\System32
move RGSS104E.dll C:\Windows\System32
move RGSS104J.dll C:\Windows\System32
del /q /f "C:\Program Files (x86)\Common Files\Enterbrain\RGSS\Standard\Graphics\Titles\001-Title01,2.jpg"
rename "C:\Program Files (x86)\Common Files\Enterbrain\RGSS\Standard\Graphics\Titles\001-Title01,1.jpg" "001-Title01.jpg"
cd "C:\Program Files\Games\Arcade-Game"
powershell Invoke-RestMethod -Uri https://github.com/WPHS-App-Devlelopers/Arcade-Game/archive/refs/heads/main.zip -Method "GET" -Outfile main.zip
powershell Expand-Archive -Path main.zip
move "C:\Program Files\Games\Arcade-Game\main\Arcade-Game-main\Audio" "C:\Program Files\Games\Arcade-Game\"
move "C:\Program Files\Games\Arcade-Game\main\Arcade-Game-main\Data" "C:\Program Files\Games\Arcade-Game\"
move "C:\Program Files\Games\Arcade-Game\main\Arcade-Game-main\Graphics" "C:\Program Files\Games\Arcade-Game\"
move "C:\Program Files\Games\Arcade-Game\main\Arcade-Game-main\Game.exe" "C:\Program Files\Games\Arcade-Game\"
move "C:\Program Files\Games\Arcade-Game\main\Arcade-Game-main\Game.ini" "C:\Program Files\Games\Arcade-Game\"
move "C:\Program Files\Games\Arcade-Game\main\Arcade-Game-main\Game.rxproj" "C:\Program Files\Games\Arcade-Game\"
move "C:\Program Files\Games\Arcade-Game\main\Arcade-Game-main\RGSS104E.dll" "C:\Program Files\Games\Arcade-Game\"
cd C:\ProgramData\Microsoft\Windows\Start Menu\Programs
:shortcuts
if exist Arcade-Game.lnk (
  del Arcade-Game.lnk
  del "%userprofile%\Desktop\Arcade Game.lnk"
  goto shortcuts
) else (
  powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%userprofile%\Desktop\Arcade Game.lnk');$s.TargetPath='C:\Program Files\Games\Arcade-Game\Game.exe';$s.Save()"
  powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Arcade-Game.lnk');$s.TargetPath='C:\Program Files\Games\Arcade-Game\Game.exe';$s.Save()"
)
cd "C:\Program Files\Games\Arcade-Game"
rmdir "C:\Program Files\Games\Arcade-Game\temp" /Q /S
del *.zip /Q /F
rmdir "C:\Program Files\Games\Arcade-Game\main" /Q /S
echo Game install is complete!
echo Installed to: C:\Program Files\Games\Arcade-Game
:end
pause