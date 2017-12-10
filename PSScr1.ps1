
#Self elevate
if(-NOT([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){   
	$arguments="& '"+$myinvocation.mycommand.definition+"'"
	Start-Process powershell -Verb runAs -ArgumentList $arguments
	Break
}
$path2=Split-Path -parent $MyInvocation.MyCommand.Definition
$path=Get-Content $path2\path.txt

Write-host "Searching for unauthorized files..."
$extensions =@("aac","ac3","avi","aiff","bat","bmp","exe","flac","gif","jpeg","jpg","mov","m3u","m4p",
"mp2","mp3","mp4","mpeg4","midi","msi","ogg","png","txt","sh","wav","wma","vqf","rainbowcrack","notavirus","payload","virus bat")
$tools =@("Cain","nmap","keylogger","Armitage","Wireshark","Metasploit","netcat","PWdump7","Fgdump",
"L0phtCrack","Ophcrack","PasswordsPro","Cain & Abel","Recover Keys","RockXP","Krbpwguess","LCP","LSASecretsView","TinyFTPD","Icmpsend","Advanced Keylogger","Spytech SpyAgent",
"Perfect Keylogger","Powered Keylogger","Sprix Keylogger","KeyGhost","Keylogger Spy Monitor","REFOG Personal Monitor","Actual Keylogger","Activity Monitor,"SpyMe Tools","Easy Remote","
"Alchemy Remote","Remote Exec","Execute This!","OsMonitor","Wiretap Pro","Spylab WebSpy","Active@Password Chang","Stellar Phoenix Password Recovery","Passware Password Recovery Kit","Password Unlocker Bundle","Offline NT Password & Registry Editor","Offline NT Password & Registry Editor",
"ElcomSoft System Recovery","Trinity Rescue Kit","Teamviewer","PopPcap")

}
Write-host "Checking $extensionsPassware Password Recovery Kit
foreach($ext in $extensions){
	Write-host "Checking for .$ext files"
	if(Test-path "$path\checkFilesOutput\$ext.txt"){Clear-content "$path\checkFilesOutput\$ext.txt"}
	C:\Windows\System32\cmd.exe /C dir C:\*.$ext /s /b | Out-File "$path\checkFilesOutput\$ext.txt"
}
Write-host "Finished searching by extension"
Write-host "Checking for $tools"
foreach($tool in $tools){
	Write-host "Checking for $tool"
	if(Test-path $path\checkFilesOutput\$tool.txt){Clear-content "$path\checkFilesOutput\$tool.txt"}
	C:\Windows\System32\cmd.exe /C dir C:\*$tool* /s /b | Out-File "$path\checkFilesOutput\$tool.txt"
}
Write-host "Finished searching for tools"
#Simple script for setting password policies in Windows.
@echo off
Write-host Setting up password policies...
net accounts /minpwlen:7 /maxpwage:30 /minpwage:10 /uniquepw:1 /forcelogoff:no /lockoutduration:30 /lockoutthreshold:7 
Write-host Password Policies Set:
Write-host Length: 7
Write-host Max Age: 30 Days
Write-host Min Age: 10 Days
Write-host Force Logoff: no
Write-host Lockout Duration: 30 Minutes
Write-host Lockout Threshold: 7
secedit.exe /export /cfg C:\secconfig.cfg
Write-host Use this command to update edited file: secedit.exe /configure /db %windir%\securitynew.sdb /cfg C:\secconfig.cfg /areas SECURITYPOLICY
Write-host Setting up auditing...
auditpol /set /category:"Audit System Events"/Failure:Success
auditpol /set /category:"Audit Process Tracking"/Faliure:Success
auditpol /set /category:"Audit Account Logon Events"/Faliure:Success
auditpol /set /category:"Audit Account Management"/Faliure:Success
auditpol /set /category:"Audit Directory Service Access"/Faliure:Success
auditpol /set /category:"Audit Logon Events"/Faliure:Success
auditpol /set /category:"Audit Object Access"/Faliure:Success
auditpol /set /category:"Audit Policy Change"/Faliure:Successs
auditpol /set /category:"Audit Privilege Use"/Faliure:Success
auditpol /set /category:"Audit Process Tracking"/Faliure:Success
auditpol /set /cateory:"Audit System Events"/Faliure:Success
Write-host Audit policies have been set
# Scanning computer
@echo off
color 0f
cls
Write-host Flashing Disk to .flashed Files to reference....
dir /b /s "C:\Program Files\" > programfiles.flashed
dir /b /s "C:\Program Files (x86)\" >> programfiles.flashed
Write-host Program Files flashed
dir /b /s "C:\Users\" > users.flashed
dir /b /s "C:\Documents and Settings" >> users.flashed
Write-host User profiles flashed
dir /b /s "C:\" > c.flashed
Write-host C:\ Flashed
pause
Write-host Finding media files in C:\Users and/or C:\Documents and Settings...
findstr .mp3 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mp3 > media_audio
findstr .ac3 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.ac3 >> media_audio
findstr .aac users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.aac >> media_audio
findstr .aiff users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.aiff >> media_audio
findstr .flac users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.flac >> media_audio
findstr .m4a users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.m4a >> media_audio
findstr .m4p users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.m4p >> media_audio
findstr .midi users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.midi >> media_audio
findstr .mp2 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mp2 >> media_audio
findstr .m3u users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.m3u >> media_audio
findstr .ogg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.ogg >> media_audio
findstr .vqf users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.vqf >> media_audio
findstr .wav users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.wav >> media_audio
findstr .wma users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.wma >> media_video
findstr .mp4 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.mp4 >> media_video
findstr .avi users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.avi >> media_video
findstr .mpeg4 users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ .mpeg4 >> media_video
REM BREAKLINE
findstr .gif users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.gif >> media_pics
findstr .png users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.png >> media_pics
findstr .bmp users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ *.bmp >> media_pics
findstr .jpg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ .jpg >> media_pics
findstr .jpeg users.flashed >NUL
if %errorlevel%==0 where /r c:\Users\ .jpeg >> media_pics
C:\WINDOWS\system32\notepad.exe media_video
C:\WINDOWS\system32\notepad.exe media_audio
C:\WINDOWS\system32\notepad.exe media_pics
echo Finding Hacktools now...
findstr "Cain" programfiles.flashed
if %errorlevel%==0 (
echo Cain detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "nmap" programfiles.flashed
if %errorlevel%==0 (
echo Nmap detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "keylogger" programfiles.flashed
if %errorlevel%==0 (
echo Potential keylogger detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "Armitage" programfiles.flashed
if %errorlevel%==0 (
echo Potential Armitage detected. Please take note, then press any key.
pause >NUL
)
cls
REM Metasploit may also very likely be named msf (Metasploit Framework) 
findstr "Metasploit" programfiles.flashed
if %errorlevel%==0 (
echo Potential Metasploit framework detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "Wireshark" programfiles.flashed
if %errorlevel%==0 (
echo Potential Wireshark framework detected. Please take note, then press any key.
pause >NUL
)
cls 
findstr "Rainbowcrack" programfiles.flashed
if %errorlevel%==0 (
echo Potential Rainbowcrck framework detected. Please take note, then press any key.
pause >NUL
)
cls

findstr "Teamviewer" programfiles.flashed
if %errorlevel%==0 (
echo Potential Teamviewer framework detected. Please take note, then press any key.
pause >NUL
)
cls
findstr "PopPcap" programfiles.flashed
if %errorlevel%==0 (
echo Potential PopPcap framework detected. Please take note, then press any key.
pause >NUL
)
cls
) 
findstr "nmap" programfiles.flashed
if %errorlevel%==0 (
echo Potential nmap framework detected. Please take note, then press any key.
pause >NUL
)
cls
REM Metasploit may also very likely be named msf (Metasploit Framework) 
findstr "Keylogger" programfiles.flashed
if %errorlevel%==0 (
echo Potential Keylogger framework detected. Please take note, then press any key.
pause >NUL
)
cls
pause



