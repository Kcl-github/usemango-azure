$tests = & "$env:progDir\FindTests.exe" -s $env:Server -p $env:Project -u $env:FindStatus
$i = 0
$matrix = @{}
for ($i; $i -lt ($tests.Length); $i +=1)
{
  $test = $tests[$i] | ConvertFrom-Json
  $matrix.add($test.Name, @{ TestId = $test.Id })
}
$jsonMatrix = $matrix | ConvertTo-Json -Compress
Write-Output "##vso[task.setvariable variable=TestId;isOutput=true]$jsonMatrix"
