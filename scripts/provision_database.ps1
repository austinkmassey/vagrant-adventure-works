git clone "https://github.com/microsoft/sql-server-samples.git" "C:\\"

#replace line 39 with path to file
$file = "Samples/Databases/adventure-works/oltp-install-script/instawdb.sql"
$find =  ':setvar SqlSamplesSourceDataPath "C:\Samples\AdventureWorks\"'
$replace =  ':setvar SqlSamplesSourceDataPath "C:\sql-server-samples\samples\databases\adventure-works/oltp-install-script/"'
(Get-Content $file).replace($find, $replace) | Set-Content $file

#run Samples/Databases/adventure-works/oltp-install-script/instawdb.sql with SQLCMD
sqlcmd -S .\master -i $file
