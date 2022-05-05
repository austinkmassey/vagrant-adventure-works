$FolderName = "C:\adventure_works_init\"
if (Test-Path $FolderName) {
    Write-Host "Folder Exists"
    Remove-Item -Recurse -Force $FolderName
    Write-Host "Removed Existing Folder"
    New-Item $FolderName -ItemType Directory
    Write-Host "Folder Created successfully"
}
else {
    New-Item $FolderName -ItemType Directory
    Write-Host "Folder Created successfully"
}

cd $FolderName
git init
git remote add -f origin "https://github.com/microsoft/sql-server-samples"
#git config core.sparseCheckout true
#"samples/databases/adventure-works" | Out-File .git/info/sparse-checkout
git pull origin master

#replace line 39 with path to file
$file = "samples/databases/adventure-works/oltp-install-script/instawdb.sql"
$find =  ':setvar SqlSamplesSourceDataPath "C:\Samples\AdventureWorks\"'
$replace =  ':setvar SqlSamplesSourceDataPath "C:\adventure_works_init\samples\databases\adventure-works/oltp-install-script/"'
(Get-Content $file).replace($find, $replace) | Set-Content $file

#run Samples/Databases/adventure-works/oltp-install-script/instawdb.sql with SQLCMD
sqlcmd -S . -i $file
