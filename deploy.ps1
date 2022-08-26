<# This script commits changes to GitHub for iOS deployment #>


param ([String]$os = "ios", [String]$m = "No version specified", [String]$pname = "project")




if ($os -eq "ios" -or $os -eq "both") {
  git add .
  git commit . -m $m
  git push -u origin main
}

if ($os -eq "android" -or $os -eq "both") {
  flutter build appbundle
}


try {
  C:\\Users\User\SCRIPTS\Credit-Tavy "Deployed $pname for Flutter."
} catch {
  Write-Output Deployed.
}