$testIds = & "$env:progDir\FindTests.exe" -s $env:Server -p $env:Project -u $env:FindStatus -f id
$i = 0
$matrix = @{}
for ($i; $i -lt ($testIds.Length); $i +=1) { $matrix.add("Test$($i+1)", @{ TestId = $testIds[$i] }) }
$jsonMatrix = $matrix | ConvertTo-Json -Compress
Write-Output "##vso[task.setvariable variable=TestId;isOutput=true]$jsonMatrix"
