#Requires -Modules PowerShellNotebook
#Requires -Modules ImportExcel

$params = @{
    xlfile = (Resolve-Path ".\datadir\excelData.xlsx").Path
}

foreach ($itemName in 'hammer', 'saw') {
    $params.itemName = $itemName
    Invoke-ExecuteNotebook -InputNotebook .\readExcel.ipynb -Parameters $params
}

'lemon', 'screwdriver' | ForEach-Object -Parallel {
    ($using:params).itemName = $_
    Invoke-ExecuteNotebook -InputNotebook .\readExcel.ipynb -Parameters $using:params
}