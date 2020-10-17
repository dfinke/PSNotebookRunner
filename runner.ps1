#Requires -Modules PowerShellNotebook

foreach ($index in 'SNP', 'GOLD', 'SSE', 'HANGSENG', 'NIKKEI') {
    Invoke-ExecuteNotebook -Force `
        -InputNotebook ./basic.ipynb `
        -Parameters @{index = $index } `
        -OutputNotebook ('basic_{0}.ipynb' -f $index)
}