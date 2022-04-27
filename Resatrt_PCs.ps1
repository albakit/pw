$testcomputers = Get-Content -Path 'C:\scripts\Receptions.txt'

# Test connection to each computer before getting the inventory info
foreach ($computer in $testcomputers) {
  if (Test-Connection -ComputerName $computer -Quiet -count 2){
    Add-Content -value $computer -path c:\scripts\restart.txt
  }else{
    Add-Content -value $computer -path c:\scripts\deadPCs.txt
  }
}


# Now that we know which PCs are live on the network
# proceed with the inventory

$computers =  restart-computer (get-content C:\scripts\restart.txt)  -Force




#restart-computer (get-content C:\scripts\restart.txt)  -Force