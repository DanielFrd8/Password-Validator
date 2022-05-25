param ($f)

$pass = "";
$errors = "False"

# Checks if the flag f exists
if ($f -ne $null){
	
	# Checks if the flag f contains a file path
	if (Test-Path -Path $f -PathType Leaf) {
		$pass = Get-Content -Path $f
	} else {
		$pass = $f
	}
	
} else {
	exit 1
}

# Checks if the password is less than 10 characters
if ($pass.length -lt 10){
	Write-Host "The password should have 10 characters" -fore red
	$errors = "True"
}

# Checks if the password has at least one number
if (-not($pass -match '\d')){
	Write-Host "The password is missing a number" -fore red
	$errors = "True"
}

# Checks if the password has at least one upper character
if (-not($pass -cmatch '[A-Z]')){
	Write-Host "The password is missing a upper case character" -fore red
	$errors = "True"
}

# Checks if the password has at least one lower character
if (-not($pass -cmatch '[a-z]')){
	Write-Host "The password is missing a lower case character" -fore red
	$errors = "True"
}

# Checks if the password is valid
if ($errors -eq "False"){
	Write-Host "The password is valid" -fore green
	exit 0
}

exit 1