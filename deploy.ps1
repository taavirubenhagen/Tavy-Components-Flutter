<# This script commits changes to GitHub for iOS deployment #>


param ([String]$OperatingSystem = "ios")




if ($OperatingSystem -eq "ios" -or $OperatingSystem -eq "both") {
  git commit deploy.ps1 pubspec.yaml ./lib ./test -m "2.0.0"
  git push -u origin main
  echo sdgsdfgdsf
}

if ($OperatingSystem -eq "android" -or $OperatingSystem -eq "both") {
  flutter build appbundle
}


try {
  C:\\Users\User\SCRIPTS\Credit-Tavy "Deployed Tavy Components for Flutter."
} catch {
  Write-Output Deployed.
}