
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
$Data1="Cain","nmap","keylogger","Armitage","Wireshark","Metasploit","netcat","PWdump7","Fgdump",
"L0phtCrack","Ophcrack","PasswordsPro","Cain & Abel","Recover Keys","RockXP","Krbpwguess","LCP","LSASecretsView","TinyFTPD","Icmpsend","Advanced Keylogger","Spytech SpyAgent",
"Perfect Keylogger","Powered Keylogger","Sprix Keylogger","KeyGhost","Keylogger Spy Monitor","REFOG Personal Monitor","Actual Keylogger","Activity Monitor,"SpyMe Tools","Easy Remote","
"Alchemy Remote","Remote Exec","Execute This!","OsMonitor","Wiretap Pro","Spylab WebSpy","Active@Password Chang","Stellar Phoenix Password Recovery","Passware Password Recovery Kit","Password Unlocker Bundle","Offline NT Password & Registry Editor","Offline NT Password & Registry Editor",
"ElcomSoft System Recovery","Trinity Rescue Kit","Teamviewer","PopPcap"
If($Data1 -notcontains "Cain","nmap","keylogger","Armitage","Wireshark","Metasploit","netcat","PWdump7","Fgdump",
"L0phtCrack","Ophcrack","PasswordsPro","Cain & Abel","Recover Keys","RockXP","Krbpwguess","LCP","LSASecretsView","TinyFTPD","Icmpsend","Advanced Keylogger","Spytech SpyAgent",
"Perfect Keylogger","Powered Keylogger","Sprix Keylogger","KeyGhost","Keylogger Spy Monitor","REFOG Personal Monitor","Actual Keylogger","Activity Monitor,"SpyMe Tools","Easy Remote","
"Alchemy Remote","Remote Exec","Execute This!","OsMonitor","Wiretap Pro","Spylab WebSpy","Active@Password Chang","Stellar Phoenix Password Recovery","Passware Password Recovery Kit","Password Unlocker Bundle","Offline NT Password & Registry Editor","Offline NT Password & Registry Editor",
"ElcomSoft System Recovery","Trinity Rescue Kit","Teamviewer","PopPcap") {
'This system contains unwanted programs'

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
echo Setting up password policies
net accounts /minpwlen:7 /maxpwage:30 /minpwage:10 /uniquepw:1 /forcelogoff:no /lockoutduration:30 /lockoutthreshold:7 
echo Password Policies Set:
echo Length: 7
echo Max Age: 30 Days
echo Min Age: 10 Days
echo Times Password can be resused: 1
echo Force Logoff: no
echo Lockout Duration: 30 Minutes
echo Lockout Threshold: 7
secedit.exe /export /cfg C:\secconfig.cfg
echo Use this command to update edited file: secedit.exe /configure /db %windir%\securitynew.sdb /cfg C:\secconfig.cfg /areas SECURITYPOLICY
echo Setting up auditing...
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
echo Audit policies have been set




