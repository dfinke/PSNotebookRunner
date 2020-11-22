# The Runners

One jupyter notebook, multiple experiments.

Simple experimentation with jupyter, PowerShell `Invoke-ExcecuteNotebook`, and parameters.

You need the `PowerShellNotebook` module installed for this to work. `Install-Module -Name PowerShellNotebook`

## CSV Runner
### Overview

Parameterize the _basic.ipynb_ notebook with `$index`. It creates a new notebook with the `$index` in the name and reads a `csv` file based on the `$index`.

_basic.ipynb_

```powershell
$index = !$index ? "SNP" : $index

$csvFilename = "$($pwd.path)/exenb/datadir/{0}.csv" -f $index
$records = import-csv $csvFilename

"$index record count: $($records.count)"
```

_runner.ps1_

```powershell
foreach ($index in 'SNP', 'GOLD', 'SSE', 'HANGSENG', 'NIKKEI') {
    Invoke-ExecuteNotebook -Force `
        -InputNotebook ./basic.ipynb `
        -Parameters @{index = $index } `
        -OutputNotebook ('basic_{0}.ipynb' -f $index)
}
```

_result_

Creates these notebooks with results from the execution.

- basic_GOLD.ipynb
- basic_HANGSENG.ipynb
- basic_NIKKEI.ipynb
- basic_SNP.ipynb
- basic_SSE.ipynb

## XLRunner
### Overview

The `readExcel.ipynb` notebook takes a required parameter an `xlfile` and two optional parameters `sheetName` and `itemName`.

`sheetName` defaults to the sheet name `one` in the notebook.

For example.

```powershell
$params = @{
    xlfile   = (Resolve-Path ".\datadir\excelData.xlsx").Path
    itemName = 'hammer'
}

Invoke-ExecuteNotebook -InputNotebook .\readExcel.ipynb -Parameters $params
```

```
Region Item   TotalSold
------ ----   ---------
East   hammer        51
South  hammer        18
```