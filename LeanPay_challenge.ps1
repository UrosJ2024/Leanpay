#Skripta koju sam napisao će raditi i za 32-bitne i za 64-bitne verzije Windows operativnog sistema. 
#PowerShell cmdlet-i koje koristimo (Get-WmiObject i Get-Process) su univerzalni i mogu pristupiti informacijama o sistemu i procesima bez obzira na arhitekturu operativnog sistema.

#Bez obzira da li koristimo 32-bitnu ili 64-bitnu verziju Windows-a, skripta će uspešno prikupiti informacije o procesoru, RAM-u, verziji operativnog sistema i pokrenutim procesima.


# Funkcija za dobijanje CPU modela
function Get-CPUModel {
    $cpu = Get-WmiObject -Class Win32_Processor | Select-Object -ExpandProperty Name
    return $cpu
}
#Ova funkcija koristi Get-WmiObject cmdlet da bi dobila informacije o procesoru. 
#Select-Object -ExpandProperty Name bira samo svojstvo Name iz rezultata, koje predstavlja model procesora.


# Funkcija za dobijanje ukupne RAM memorije
function Get-TotalRAM {
    $ram = Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty TotalPhysicalMemory
    $ramGB = [math]::Round($ram / 1GB, 2)
    return "$ramGB GB"
}
# Koriscenje Get-WmiObject cmdlet jer dobija informacije o računaru. 
# Select-Object -ExpandProperty TotalPhysicalMemory bira samo svojstvo TotalPhysicalMemory koje predstavlja ukupnu RAM memoriju. 
# Zatim se vrednost RAM-a pretvara u gigabajte i zaokružuje na dve decimale.


# Funkcija za dobijanje OS verzije
function Get-OSVersion {
    $os = Get-WmiObject -Class Win32_OperatingSystem | Select-Object -ExpandProperty Caption
    return $os
}
# Koriscenje Get-WmiObject cmdlet jer dobija informacije o operativnom sistemu. 
# Select-Object -ExpandProperty Caption bira samo svojstvo Caption koje predstavlja verziju operativnog sistema.

# Display system information
Write-Host "System Information:"
Write-Host "CPU: $(Get-CPUModel)"
Write-Host "RAM: $(Get-TotalRAM)"
Write-Host "OS Version: $(Get-OSVersion)"
Write-Host ""
#Ovaj deo skripte jednostavno prikazuje informacije o sistemu korišćenjem funkcija koje sam definisao ranije. 
#$(...) dodaje vrednost rezultata funkcija unutar stringa.

Display running processes
Write-Host "Running Processes:"
Get-Process | Format-Table -AutoSize
#Ovaj deo skripte prikazuje sve pokrenute procese na računaru koristeći Get-Process cmdlet. 
#Format-Table -AutoSize se koristi da bi rezultati bili prikazani u tabelarnom formatu sa prilagođenom širinom kolona.



