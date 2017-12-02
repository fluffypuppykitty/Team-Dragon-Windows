
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
"mp2","mp3","mp4","mpeg4","midi","msi","ogg","png","txt","sh","wav","wma","vqf")
$tools =@("Cain","nmap","keylogger","Armitage","Wireshark","Metasploit","netcat","PWdump7","Fgdump",
"L0phtCrack","Ophcrack","PasswordsPro","Cain & Abel","Recover Keys","RockXP","Krbpwguess","LCP","LSASecretsView","TinyFTPD","Icmpsend","Advanced Keylogger","Spytech SpyAgent",
"Perfect Keylogger","Powered Keylogger","Sprix Keylogger","KeyGhost","Keylogger Spy Monitor","REFOG Personal Monitor","Actual Keylogger","Activity Monitor,"SpyMe Tools","Easy Remote","
"Alchemy Remote","Remote Exec","Execute This!","OsMonitor","Wiretap Pro","Spylab WebSpy","Active@Password Chang","Stellar Phoenix Password Recovery","Passware Password Recovery Kit","Password Unlocker Bundle","Offline NT Password & Registry Editor","Offline NT Password & Registry Editor",
"ElcomSoft System Recovery","Trinity Rescue Kit","Teamviewer","PopPcap")





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
