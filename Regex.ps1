$others = "@modelcode '2E%' OR @modelcode '31R%' OR @modelcode 'TE1%'"
$regex = "\'([a-zA-Z0-9]{1,})\%\'";
$path = 'C:\RegTest\';
$file = $path+'RegTest.txt';

$result = [regex]::Matches($others, $regex)

$rest  = $others | Select-String -Pattern $regex -AllMatches;

$t = $rest.Matches


if(-not (Test-Path -Path $path -PathType Container)){
  New-Item -ItemType Directory -Path $path
  New-Item -ItemType File -Path $file;
}

Set-Content -Path $file -Value $t.Value

Start -FilePath $path

