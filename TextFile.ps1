# Kreiranje direktorijuma "Leanpay"
New-Item -ItemType Directory -Path "C:\Users\Public\Leanpay"

# Putanja do .txt fajla
$txtFilePath = "$direktorijumPath\TextFile.txt"

# Upisivanje "Hello world!" u .txt fajl
Set-Content -Path $txtFilePath -Value "Hello world!"

Write-Host ""
# Provera da li je fajl uspešno kreiran
if (Test-Path $txtFilePath) {
    Write-Host "Fajl 'TextFile.txt' uspešno kreiran i tekst uspešno upisan."
} else {
    Write-Host "Došlo je do greške prilikom kreiranja fajla 'TextFile.txt'."
}

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
