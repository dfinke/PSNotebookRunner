# The Runner

One notebook, multiple experiments.

Parameterize the _basic.ipynb_ notebook with `$index`. It creates a new notebook with the `$index` in the name and reads a `csv` file based on the `$index`.

_basic.ipynb_

```powershell
$index = !$index ? "SNP" : $index

$csvFilename = "$($pwd.path)/exenb/datadir/{0}.csv" -f $index
$records = import-csv $csvFilename

"$index record count: $($records.count+1)"
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