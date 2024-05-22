# Import the AzureAD module
Import-Module AzureAD

# Connect to Azure AD with your user credentials
Connect-AzureAD

# Get all verified domains in Azure AD
$domains = Get-AzureADDomain

# Get all users
$allUsers = Get-AzureADUser

# Loop through each domain to get the users
foreach ($domain in $domains) {
    # Write-Output a unicode character to separate the domains
    Write-Output "----------------------------------------------------------"
    Write-Output "Domain: $($domain.Name)"

    # Filter users for the current domain
    $users = $allUsers | Where-Object { $_.UserPrincipalName -like "*@$($domain.Name)" }

    # iterate through the users
    foreach ($user in $users) {
        Write-Output "User: $($user.UserPrincipalName)"
    }
    Write-Output "----------------------------------------------------------"
}