###############################################################################################################
#              Version 1.0 | Tested on Windows 10, 11 and Server 16, 19 and 2022.
#              This is a Script to send notifications to users that will be disconnected after the configured time.
#
#
#              In case of concerns, please reach out to kairon.alves@hp.com
#####################


#### Initial Message

$wshell = New-Object -ComObject Wscript.Shell
$Output = $wshell.Popup("Welcome to the Lab!

Please be aware that your remote session will be disconnected according to your Access Shift")

#notification Function 

Add-Type -AssemblyName System.Windows.Forms
$global:balmsg = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balmsg.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
$balmsg.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
$wshell = New-Object -ComObject Wscript.Shell
[reflection.assembly]::loadwithpartialname('System.Windows.Forms')
[reflection.assembly]::loadwithpartialname('System.Drawing')
$notify = new-object system.windows.forms.notifyicon
$notify.icon = [System.Drawing.SystemIcons]::Information
$notify.visible = $trued

#Get Current Time to define which time window the student belongs.

$timenow = Get-Date -Format hh:mm

#Morning Students where access window is between 00:01 - 08:00
if($timenow -ge "00:01" -and $timenow -lt "08:00"){
	
	$b = [datetime]"08:00"
	$DisplayMin = (New-TimeSpan -Start $timenow -End $b).TotalMinutes	
	$DisplayHours = (New-TimeSpan -Minutes "$DisplayMin").Hours
    $DisplayMinShow = (New-TimeSpan -Minutes "$DisplayMin").Minutes
		$balmsg.BalloonTipText = "Your Session will be Disconnected in $DisplayHours Hours and $DisplayMinShow Minutes"
		$balmsg.BalloonTipTitle = "Attention $Env:USERNAME"
		$balmsg.Visible = $true
		$balmsg.ShowBalloonTip(20000)
		
	
		if($DisplayMin -gt 15){
		$SleepTime = (($DisplayMin - 15) * 60)
		Start-Sleep -Seconds $SleepTime}
		
		$balmsg.BalloonTipText = "Your Session will be Disconnected in 15 minutes"
		$balmsg.BalloonTipTitle = "Attention $Env:USERNAME"
		$balmsg.Visible = $true
		$balmsg.ShowBalloonTip(20000)
	
}


#Afternoon Students where access window is between 08:01 - 16:00
if($timenow -ge "08:01" -and $timenow -lt "16:00"){
	$b = [datetime]"16:00"
	$DisplayMin = (New-TimeSpan -Start $timenow -End $b).TotalMinutes	
	$DisplayHours = (New-TimeSpan -Minutes "$DisplayMin").Hours
    $DisplayMinShow = (New-TimeSpan -Minutes "$DisplayMin").Minutes	
		$balmsg.BalloonTipText = "Your Session will be Disconnected in $DisplayHours Hours and $DisplayMinShow Minutes"
		$balmsg.BalloonTipTitle = "Attention $Env:USERNAME"
		$balmsg.Visible = $true
		$balmsg.ShowBalloonTip(20000)
	
	
		if($DisplayMin -gt 15){
		$SleepTime = (($DisplayMin - 15) * 60)
		Start-Sleep -Seconds $SleepTime}
		
		$balmsg.BalloonTipText = "Your Session will be Disconnected in 15 minutes"
		$balmsg.BalloonTipTitle = "Attention $Env:USERNAME"
		$balmsg.Visible = $true
		$balmsg.ShowBalloonTip(20000)
}

#Evening Students where access window is between 16:01 - 00:00
if($timenow -ge "16:01" -and $timenow -lt "23:59"){
	$b = [datetime]"23:59"
	$DisplayMin = (New-TimeSpan -Start $timenow	-End $b).TotalMinutes
	$DisplayHours = (New-TimeSpan -Minutes "$DisplayMin").Hours
    $DisplayMinShow = (New-TimeSpan -Minutes "$DisplayMin").Minutes
		$balmsg.BalloonTipText = "Your Session will be Disconnected in $DisplayHours Hours and $DisplayMinShow Minutes"
		$balmsg.BalloonTipTitle = "Attention $Env:USERNAME"
		$balmsg.Visible = $true
		$balmsg.ShowBalloonTip(20000)
	
		if($DisplayMin -gt 15){
		$SleepTime = (($DisplayMin - 15) * 60)
		Start-Sleep -Seconds $SleepTime}
		
		$balmsg.BalloonTipText = "Your Session will be Disconnected in 15 minutes"
		$balmsg.BalloonTipTitle = "Attention $Env:USERNAME"
		$balmsg.Visible = $true
		$balmsg.ShowBalloonTip(20000)
}





