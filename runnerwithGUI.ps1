#Requires -Modules PowerShellNotebook, Microsoft.PowerShell.ConsoleGuiTools

$list = 'SNP', 'GOLD', 'SSE', 'HANGSENG', 'NIKKEI' | Out-ConsoleGridView -OutputMode Multiple

foreach ($index in $list) {
    Invoke-ExecuteNotebook -Force `
        -InputNotebook ./basic.ipynb `
        -Parameters @{index = $index } `
        -OutputNotebook ('basic_{0}.ipynb' -f $index)
}