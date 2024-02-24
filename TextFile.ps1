# Kreiranje direktorijuma "Leanpay"
New-Item -ItemType Directory -Path "C:\Users\Public\Leanpay"

# Kreiranje .txt fajla i upisivanje "Hello world!" unutar njega
Set-Content -Path "C:\Users\Public\Leanpay\TextFile.txt" -Value "Hello world!"


<#KORISNIK SAM BIRA GDE CUVA FAJL

# Korisniku se prikazuje dijalog za odabir foldera
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = "Izaberite direktorijum za čuvanje rezultata"
$folderBrowser.ShowNewFolderButton = $true
$dialogResult = $folderBrowser.ShowDialog()

# Ako korisnik izabere folder i pritisne OK
if ($dialogResult -eq "OK") {
    # Putanja izabranog foldera
    $chosenFolderPath = $folderBrowser.SelectedPath

    # Kreiranje direktorijuma i fajla u izabranom folderu
    New-Item -ItemType Directory -Path $chosenFolderPath\Leanpay
    Set-Content -Path "$chosenFolderPath\Leanpay\HelloWorld.txt" -Value "Hello world!"

    Write-Host "Direktorijum i fajl su uspešno kreirani u izabranom folderu."
} else {
    Write-Host "Operacija je otkazana."
}
#>