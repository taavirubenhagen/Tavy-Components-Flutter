<# This script commits changes to GitHub for iOS deployment #>


param ([String]$OperatingSystem = "ios")




if ($OperatingSystem -eq "ios" -or $OperatingSystem -eq "both") {
  git commit . -m "2.0.0"
  git push -u origin master
}

if ($OperatingSystem -eq "android" -or $OperatingSystem -eq "both") {
  flutter build appbundle
}


try {
  C:\\Users\User\SCRIPTS\Credit-Tavy "Deployed Tavy Components for Flutter."
} catch {
  Write-Output Deployed.
}