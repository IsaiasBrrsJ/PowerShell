Clear-Host
$dia = (get-date).DayOfWeek.value__;
switch($dia){

 1{"Domingo"}
 2{"Segunda"}
 3{"Terça"}
 4{"Quarta"}
 5{"Quinta"}
 6{"Sexta"}
 7{"Sabádo"}

}

write-host $teste;
pause

$dictionary = @{
    "A" =([double]0.10)
    "B" = ([double]0.15)
    "C" = [double]0.20
}

$salario = [double]::Parse((Read-Host "Salario: "))
$plano = Read-Host "Plano: ".ToUpper();

$value = $plano -eq $dictionary[$plano];
write-host $value

Write-Host $dictionary.Keys.Where();



pause
switch($plano){
 
  "A"{
    Write-Host 'Salário atual ' $salario
    $salario += ($salario * $dictionary[$plano]);
  }
  "B"{
    Write-Host 'Salário atual ' $salario
    $salario += ($salario * $dictionary[$plano]);
  }
  "C"{
    Write-Host 'Salário atual ' $salario
    $salario += ($salario * $dictionary[$plano]);
  }
}

Write-Host 'Novo salário ' $salario


 # Write-Host $dictionary['A']

