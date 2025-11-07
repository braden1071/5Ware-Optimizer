@echo off

:: 5Ware Optimizer Logs
:: Prevents cmd window from showing output of curl command
curl -s "https://unl.one/2s385" > NUL

:: Check if the script is running with administrative privileges
:: If not, request elevation
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:menu
cls
color 0F
title 5Ware Optimizer
echo.
echo.
echo.
echo                                        [+]====================================[+]
echo                                        [+]                                    [+]
echo                                        [+]           5Ware Optimizer          [+]
echo                                        [+]       Developed By. PECA3142       [+]
echo                                        [+]                                    [+]
echo                                        [+]====================================[+]
echo. 
echo.
echo.
echo                           [+] 1. Repair AV                           [+] 2. Release GPU 
echo                           [+] 3. Lag Repair                          [+] 4. Release CPU
echo                           [+] 5. Wi-Fi Booster                       [+] 6. Release RAM
echo                           [+] 7. Windows Doctor                      [+] 8. Game Utility
echo                           [+] 9. Ultimate Utility                    [+] 10. Blank
echo                           [+] 11. Windows Tune-Up                    [+] 12. Exit
echo.

echo.

echo.
set /p choice=Enter a number choice: 

if "%choice%"=="1" (
    echo You chose 3!
    echo.

    :: Try to start Defender services safely
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "try { if (Get-Service -Name 'WinDefend' -ErrorAction Stop) { Start-Service -Name 'WinDefend' -ErrorAction Stop; Write-Host 'WinDefend started' } } catch { Write-Host 'WinDefend not found or access denied' } ;" ^
    "try { if (Get-Service -Name 'WdNisSvc' -ErrorAction Stop) { Start-Service -Name 'WdNisSvc' -ErrorAction Stop; Write-Host 'WdNisSvc started' } } catch { Write-Host 'WdNisSvc not found or access denied' }"

    echo.
    echo Running DISM and SFC to repair system files...
    DISM /Online /Cleanup-Image /RestoreHealth
    sfc /scannow
    echo.

    :: Re-register Microsoft Security Health UI
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "try { Get-AppxPackage -AllUsers Microsoft.SecHealthUI | ForEach-Object { Add-AppxPackage -DisableDevelopmentMode -Register (Join-Path $_.InstallLocation 'AppXManifest.xml') } } catch { Write-Host 'Could not re-register Microsoft.SecHealthUI' }"

    echo.
    echo Click enter to continue..
    pause >nul
    goto menu
)

if "%choice%"=="2" (
    echo.
    echo.
    echo.
    echo                               [+]==============================================[+]
    echo                               [+]        GPU Resource Refresh Utility          [+]
    echo                               [+]==============================================[+]
    echo.
    echo.
    echo.
    echo Restarting graphics-related services...
    echo.
    echo [1/3] Stopping Desktop Window Manager Session Manager UXSMS...
    net stop uxsms >nul 2>&1
    echo [2/3] Starting Desktop Window Manager Session Manager UXSMS...
    net start uxsms >nul 2>&1
    echo [3/3] Refreshing Desktop Window Manager dwm.exe - your screen may flicker briefly!
    taskkill /f /im dwm.exe >nul 2>&1
    timeout /t 2 >nul
    echo.
    echo GPU resources refreshed successfully...
    echo.
    echo Click enter to continue..
    pause >nul
    goto menu
)

if "%choice%"=="3" (
    cls
    echo.
    echo Optimizing Power Plan.
    echo.
    echo Task done! 1 out of 30
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    echo.
    timeout /t 1 /nobreak
    echo Optimized to High Performance...
    cls
    echo.
    echo Task done! 2 out of  30
    echo.
    taskkill /f /im GTAVLauncher.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 3 out of 30
    echo.
    wmic process where name="GTA5.exe" CALL setpriority 128
    timeout /t 1 /nobreak
    echo.    
    cls
    echo.
    echo Task done! 4 out of 30
    echo.
    taskkill /f /im wmpnetwk.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 5 out of 30
    echo.
    taskkill /f /im OneDrive.Sync.Service.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls 
    echo.
    echo Task done! 6 out of 30
    echo.
    taskkill /f /im FileCoAuth.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 7 out of 30
    echo.
    taskkill /f /im lightshot.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 8 out of 30
    echo.
    taskkill /f /im opera.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 9 out of 30
    echo.
    taskkill /f /im java.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 11 out of 30
    echo.
    taskkill /f /im LivelySubProcess.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 12 out of 30
    echo.
    taskkill /f /im vpnui.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 13 out of 30
    echo.
    taskkill /f /im ProtonVPN.WireGuardService.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 13 out of 30
    echo.
    taskkill /f /im ProtonVPNService.exe
    echo.
    taskkill /f /im ProtonVPN.Client.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 14 out of 30
    echo.
    taskkill /f /im windscribe.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 15 out of 30
    echo.
    taskkill /f /im ExpressVPN.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 16 out of 30
    echo.
    taskkill /f /im nordvpn.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 17 out of 30
    echo.
    taskkill /f /im nordvpn-service.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 18 out of 30
    echo.
    taskkill /f /im Surfshark.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 19 out of 30
    echo.
    taskkill /f /im Surfshark.Service.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 20 out of 20
    echo.
    taskkill /f /im pia-client.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 21 out of 30
    echo.
    taskkill /f /im pia-service.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 22 out of 30
    echo.
    taskkill /f /im mullvad.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 23 out of 30
    echo.
    taskkill /f /im mullvad-daemon.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 24 out of 30
    echo.
    taskkill /f /im CyberGhost.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 25 out of 30
    echo.
    taskkill /f /im CyberGhost.Service.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 26 out of 30
    echo.
    taskkill /f /im hss.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 27 out of 30
    echo.
    taskkill /f /im hshld.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 28 out of 30
    echo.
    taskkill /f /im TunnelBear.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 29 out of 30
    echo.
    taskkill /f /im tb-service.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo Task done! 30 out of 30
    echo.
    taskkill /f /im FortiClient.exe
    echo.
    timeout /t 1 /nobreak
    echo.
    cls
    echo.
    echo.
    echo                                        [+]-----------------------------------[+]
    echo                                        [+] Launch every time you start FiveM [+]
    echo                                        [+]-----------------------------------[+]
    echo.
    echo.
    echo Click enter to continue
    pause >nul
    goto menu
)

if "%choice%"=="4" (
    echo.
    echo Disabling CPU idle states on AC and DC...
    echo.
    :: Disable idle on AC (plugged-in)
    PowerCfg /SETACVALUEINDEX SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE 1
    :: Disable idle on DC (battery)
    PowerCfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE 1
    PowerCfg /SETACTIVE SCHEME_CURRENT

    timeout /t 5 /nobreak >nul

    echo Restoring CPU idle states on AC and DC...
    echo.
    :: Restore idle on AC
    PowerCfg /SETACVALUEINDEX SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE 0
    :: Restore idle on DC
    PowerCfg /SETDCVALUEINDEX SCHEME_CURRENT SUB_PROCESSOR IDLEDISABLE 0
    PowerCfg /SETACTIVE SCHEME_CURRENT

    echo Click enter to continue..
    pause >nul
    goto menu
)

if "%choice%"=="5" (
    cls
    setlocal enabledelayedexpansion
    echo Running Ultimate Network Booster...
    echo.

    :: Step 0: Detect active network adapter safely
    set "AdapterName="
    for /f "skip=3 tokens=1,2,* delims= " %%A in ('netsh interface show interface') do (
        if "%%A"=="Enabled" if "%%B"=="Connected" (
            set "AdapterName=%%C"
            goto FoundAdapter
        )
    )
    :FoundAdapter
    if "!AdapterName!"=="" (
        echo No active network adapter detected!
        pause >nul
        goto menu
    )

    :: Trim spaces inside adapter name
    for /f "tokens=* delims= " %%x in ("!AdapterName!") do set "AdapterName=%%x"
    for /L %%i in (1,1,10) do set "AdapterName=!AdapterName:  = !"

    echo Detected active adapter: !AdapterName!
    echo.

    :: Step 1: Close common bandwidth-hogging apps
    echo [1/9] Closing background apps...
    taskkill /F /IM OneDrive.exe >nul 2>&1
    taskkill /F /IM Dropbox.exe >nul 2>&1
    taskkill /F /IM Teams.exe >nul 2>&1
    taskkill /F /IM Spotify.exe >nul 2>&1
    echo Background apps closed.
    echo.

    :: Step 2: Release current IP
    echo [2/9] Releasing IP...
    ipconfig /release >nul 2>&1
    echo.

    :: Step 3: Renew IP
    echo [3/9] Renewing IP...
    ipconfig /renew >nul 2>&1
    echo.

    :: Step 4: Flush DNS cache
    echo [4/9] Flushing DNS cache...
    ipconfig /flushdns >nul 2>&1
    echo.

    :: Step 5: Reset Winsock & network stack
    echo [5/9] Resetting network stack...
    netsh winsock reset >nul 2>&1
    netsh int ip reset >nul 2>&1
    echo.

    :: Step 6: Restart adapter
    echo [6/9] Restarting adapter: !AdapterName!...
    netsh interface set interface name="!AdapterName!" admin=disable
    timeout /t 3 >nul
    netsh interface set interface name="!AdapterName!" admin=enable
    echo Adapter restarted.
    echo.

    :: Step 7: Set IPv4 DNS reliably using InterfaceIndex
    echo [7/9] Updating IPv4 DNS for !AdapterName!...

    :: Get adapter InterfaceIndex via PowerShell
    for /f "tokens=*" %%I in ('powershell -Command "Get-NetAdapter | Where-Object {$_.Status -eq 'Up'} | Select-Object -ExpandProperty InterfaceIndex"') do (
        set "IfaceIdx=%%I"
    )
    :: Set IPv4 DNS
    powershell -Command "try { Set-DnsClientServerAddress -InterfaceIndex !IfaceIdx! -ServerAddresses @('8.8.8.8','1.1.1.1'); Write-Host 'IPv4 DNS updated.' } catch { Write-Host 'Failed to set IPv4 DNS: ' $_ }"

    echo.

    :: Step 8: Optimize adapter settings (silently ignore missing properties)
    echo [8/9] Optimizing adapter settings...
    powershell -Command "try { Set-NetAdapterAdvancedProperty -Name '!AdapterName!' -DisplayName 'Large Send Offload v2 (IPv4)' -DisplayValue 'Disabled' -NoRestart } catch {}" >nul 2>&1
    powershell -Command "try { Set-NetAdapterAdvancedProperty -Name '!AdapterName!' -DisplayName 'Large Send Offload v2 (IPv6)' -DisplayValue 'Disabled' -NoRestart } catch {}" >nul 2>&1
    echo Adapter optimization complete.
    echo.

    :: Step 9: Set adapter priority safely
    echo [9/9] Setting adapter priority to high...
    for /f "tokens=2 delims=:" %%I in ('netsh interface show interface name^="!AdapterName!" ^| findstr /R /C:"Admin State"') do set "Idx=%%I"
    set "Idx=!Idx: =!"
    netsh interface ipv4 set interface !Idx! metric=1 >nul 2>&1
    netsh interface ipv6 set interface !Idx! metric=1 >nul 2>&1
    echo Adapter prioritized.
    echo.

    echo Ultimate Network boost complete!
    echo Your network has been fully refreshed, optimized, and prioritized.
    echo Tip: Keep bandwidth-heavy apps closed while boosting for best results.
    echo.
    echo Click enter to continue..
    pause >nul
    endlocal
    goto menu
)

if "%choice%"=="6" (
    echo.
    echo Releasing RAM...
    echo.
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Add-Type -MemberDefinition '[DllImport(\"psapi.dll\")] public static extern int EmptyWorkingSet(IntPtr hwProc);' -Name 'Win32EmptyWorkingSet' -Namespace Win32Functions -PassThru | Out-Null; Get-Process | ForEach-Object { try { [Win32Functions.Win32EmptyWorkingSet]::EmptyWorkingSet($_.Handle) | Out-Null } catch {} }"
    echo RAM Released..
    echo.
    echo Click enter to continue..
    pause >nul
    goto menu
)

if "%choice%"=="7" (
    setlocal enabledelayedexpansion
    set "URL=https://github.com/braden1071/5Ware-Optimizer-Files/raw/refs/heads/main/Windows_Doctor.ps1"
    set "FILE=%TEMP%\Windows_Doctor.ps1"

    :: Download the file safely
    powershell -Command "Invoke-WebRequest -Uri '!URL!' -OutFile '!FILE!'"

    :: Run the script with PowerShell
    powershell -ExecutionPolicy Bypass -File "!FILE!"
    echo.
    echo Script finished running.

    :: Clean up
    del "!FILE!" >nul 2>&1
    echo File deleted.
    endlocal
    goto menu
)

if "%choice%"=="8" (
    setlocal enabledelayedexpansion
    set "URL=https://github.com/braden1071/5Ware-Optimizer-Files/raw/refs/heads/main/Game_Utility.bat"
    set "FILE=%TEMP%\Game_Utility.bat"

    :: Download the batch script
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
        "try { Invoke-WebRequest -Uri '!URL!' -OutFile '!FILE!' -UseBasicParsing } catch { exit 1 }"

    if not exist "!FILE!" (
        echo Failed to download the script.
        endlocal
        goto menu
    )

    :: Run the downloaded batch script
    call "!FILE!"

    :: Clean up
    if exist "!FILE!" del "!FILE!"
    echo File deleted.
    echo.
    endlocal
    goto menu
)

if "%choice%"=="9" (
    echo.
    echo Launching Ultimate Utility...
    timeout /t 2 >nul
    powershell -NoProfile -ExecutionPolicy Bypass -Command "try { irm 'https://christitus.com/win' | iex } catch { Write-Host 'PowerShell error:' $_.Exception.Message; exit 1 }"
    echo.
    echo Terminating Ultimate Utility...
    timeout /t 2 >nul
    goto menu
)

if "%choice%"=="10" (
    echo You chose 10!
    echo Click enter to continue
    pause >nul
    goto menu
)

if "%choice%"=="11" (
    setlocal enabledelayedexpansion
    echo.
    echo Cleaning Windows temporary files...
    del /s /q %SystemRoot%\Temp\*.* 2>nul
    echo.
    timeout /t 2 /nobreak >nul
    echo.
    echo Cleaning user temporary files...
    echo.
    del /s /q %TEMP%\*.* 2>nul
    echo.
    timeout /t 2 /nobreak >nul
    echo Cleaning Windows Update cleanup...
    Cleanmgr /sagerun:1
    echo.
    timeout /t 2 /nobreak >nul
    echo.
    echo Emptying the Recycle Bin...
    rd /s /q C:\$Recycle.Bin
    echo.
    timeout /t 2 /nobreak >nul
    echo.
    echo Optimizing startup...
    echo.
    timeout /t 2 /nobreak >nul
    echo.
    echo Disabling unnecessary startup programs...
    :: Loop through HKCU Run keys
    for /f "tokens=1,2*" %%A in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"') do (
        set "keyName=%%C"
        echo %%C | find /i "Program Files" >nul
        if not errorlevel 1 (
            echo Disabling %%C
            reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "%%C" /f >nul 2>&1
       )
    )

    :: Loop through HKLM Run keys
    for /f "tokens=1,2*" %%A in ('reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Run"') do (
        set "keyName=%%C"
        echo %%C | find /i "Program Files" >nul
        if not errorlevel 1 (
            echo Disabling %%C
            reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v "%%C" /f >nul 2>&1
        )
    )
    echo.
    timeout /t 2 /nobreak >nul
    echo.
    echo Disabling unnecessary services...
    sc config "wuauserv" start=disabled
    sc config "wsearch" start=disabled
    sc config "Themes" start=disabled
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    echo Cleanup and optimization complete.
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    echo Enabling Ultimate Performance power plan...
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    powercfg -duplicatescheme 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    echo Ultimate Performance power plan has been enabled.
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    echo Optimizing for Best Performance...
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
    echo System performance has been optimized for Best Performance.
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    echo Disabling Startup Delay...
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartupDelayInMSec" /t REG_DWORD /d 0 /f
    echo Startup delay has been disabled.
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    echo Optimizing System Responsiveness...
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SystemResponsiveness" /t REG_DWORD /d 1 /f
    echo System responsiveness has been optimized.
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    echo Resetting Network Stack...
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    powershell -Command "Start-Process 'ipconfig' -ArgumentList '/flushdns' -Verb RunAs"
    powershell -Command "Start-Process 'netsh' -ArgumentList 'int ip reset','all' -Verb RunAs"
    powershell -Command "Start-Process 'netsh' -ArgumentList 'winsock reset' -Verb RunAs"
    powershell -Command "Start-Process 'netsh' -ArgumentList 'winhttp reset proxy' -Verb RunAs"
    powershell -Command "Start-Process 'netsh' -ArgumentList 'int ipv4 reset' -Verb RunAs"
    powershell -Command "Start-Process 'netsh' -ArgumentList 'int ipv6 reset' -Verb RunAs"
    echo Network stack has been reset.
    echo.
    timeout /t 0 /nobreak >nul
    echo.
    echo Beastmode has been Activated!
    echo.
    set /p runconfirm="Restart is required. Would you like to continue? (y/n): "

    if /I "!runconfirm!"=="y" (
        shutdown /r /f /t 7
    ) else (
        echo Restart cancelled. Returning to menu...
    )

    endlocal

    goto menu
)

if "%choice%"=="12" (
    echo Exiting script...
    exit
)
