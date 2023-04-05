###############################################################################################################
#              Version 1.0 | Tested on Windows Server 2022, 2019
#              This is a Script to force logoff of users connected in remote workstations
#
#              In case of concerns, please reach out to kairon.alves@hp.com
#####################


##### Get list of Computers and check active sessions
$WorkstationList = (Get-ADComputer -Filter * -SearchBase "OU DN Path").Name

foreach($Workstation in $WorkstationList){

# Check if Computer is online
   if(Test-Connection -ComputerName $Workstation -Count 1 -Quiet){
 
  $UserName = "ST_"
  $sessionId = (((quser /server:$workstation | Where-Object { $_ -match $userName }) -split ‘ +’)[3])
  
  if($sessionId -ne $null){logoff $sessionId /server:$workstation}
  

  } 


}



