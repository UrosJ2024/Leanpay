# Postavljanje URL adrese Notepad++ MSI fajla
$url = "https://github.com/UrosJ2024/Leanpay/blob/leanpay_test/Notepad%2B%2B7_9_1.msi"

# Postavite putanju na kojoj želite da sačuvate preuzeti fajl na lokalnom računaru
$lokacija = "C:\Users\Public\Notepad++7_9_1.msi"

# Preuzimanje fajla sa datog URL-a
Invoke-WebRequest -Uri $url -OutFile $lokacija

# Pokretanje Notepad++ aplikacije na udaljenom računaru
Start-Process msiexec.exe -ArgumentList "/i `"$lokacija`" /quiet /norestart" -Wait
