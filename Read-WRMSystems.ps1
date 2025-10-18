# Define login and data endpoints
$baseUrl = "https://wmd.wrm-systems.fi"
$loginUrl = "$baseUrl/kirkkonummenvesi/login"
$dataUrl = "$baseUrl/data/readings"


# Define login credentials if using email:
$email = "email.address@domain.com"
$password = "Password123"

# Define customer number if not using email login:
$customerNumber = "12345"

# Define water meter serial number and date range
$serialNumber = "1234567"
$startDate = get-date((get-date).adddays(-1)) -Format yyyy-MM-dd
$endDate = get-date -Format yyyy-MM-dd

# Create a web session to store cookies
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession

# Prepare login payload
$loginPayload = @{
    "mode" = "water"
    "login-email" = $email
    "login-password" = $password
    "login-by" = "email"
}

#NOTE: If you log in using customer number and water meter number, replace the above payload with this (NOT TESTED):
#$loginPayload = @{
#    "mode" = "water"
#    "login-input-a" = $customerNumber
#    "login-input-b" = $serialNumber
#    "login-by" = "ul"
#}


$loginBody = ($loginPayload.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" }) -join "&"

# Send login request
$loginResponse = Invoke-WebRequest -Uri $loginUrl -Method POST -Body $loginBody -ContentType "application/x-www-form-urlencoded" -WebSession $session

# Check login success
if ($loginResponse.StatusCode -ne 200) {
    Write-Host "Login failed with status code: $($loginResponse.StatusCode)"
    return
}

Write-Host "Login successful!"

# Build data request URL
$dataUri = "$($dataUrl)?serialNumber=$($serialNumber)&startDate=$($startDate)&endDate=$($endDate)"

# Send GET request to fetch readings
$dataResponse = Invoke-WebRequest -Uri $dataUri -Method GET -WebSession $session

# Parse and display readings
$data = $dataResponse.Content | ConvertFrom-Json

Write-Host "`nWater Consumption Readings:"

# Print header row
$header = "{0,-20} {1,10} {2,8}" -f "Timestamp", "Total (m3)", "Delta (l)"
Write-Host $header
Write-Host ("-" * $header.Length)

# Print readings
foreach ($reading in $data) {
    $timestamp = $reading[0]
    $value = $reading[1]
    $delta = $reading[2]
    $liters = [int]($delta * 1000)

    $output = "{0,-20} {1,10} {2,8}" -f $timestamp, "$value", "$liters"
    Write-Host $output
}
