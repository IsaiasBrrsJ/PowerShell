Clear-Host;

$altura = [single]( Read-Host 'Digite sua altura ');
$peso = [single](Read-Host 'Digite seu peso ');

$IMC =[double]$peso / ($altura * $altura)

$message = [string]::Empty;

if($IMC -ge 40){
  $message = "Obesidade grau III (mórbida)" 
}
elseif($IMC -ge 35){
 $message = "Obesidade grau II (grave)"
}
elseif($IMC -ge 30){
$message = "Obesidade grau I"
}
elseif($IMC -ge 25){
$message = "Sobrepreso"
}
elseif($IMC -ge 18.5){
 $message = "Faixa de peso ideal"
}
elseif($IMC -ge 16){
 $message = "Abaixo do peso ideal"
}
elseif($IMC -ge 15){
 $message = "Gravemente abaixo do peso"
}
else{
 $message = "Extremamente abaixo do peso"
}

Write-Host "$IMC" "$message" -Separator ": ";
