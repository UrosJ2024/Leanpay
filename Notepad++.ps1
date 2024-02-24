# Postavljanje URL adrese Notepad++ MSI fajla
$url = "https://github.com/UrosJ2024/Leanpay/blob/leanpay_test/Notepad%2B%2B7_9_1.msi"

# Postavljanje putanje na kojoj ce biti sacuvan preuzeti fajl na lokalnom računaru
$lokacija = "C:\Users\Public\Notepad++7_9_1.msi"

# Preuzimanje fajla sa datog URL-a
$response = Invoke-WebRequest -Uri $url -OutFile $lokacija

# Provera da li je preuzimanje uspešno
if ($response.StatusCode -eq 200) {
    Write-Host "Fajl uspešno preuzet."
    # Pokretanje Notepad++ aplikacije na udaljenom računaru
    Start-Process msiexec.exe -ArgumentList "/i `"$lokacija`" /quiet /norestart" -Wait
} else {
    Write-Host "Greška prilikom preuzimanja fajla."
}
