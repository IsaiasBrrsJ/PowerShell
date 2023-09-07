$lista = 1,2,3,4,5,6,7,8,9,10;


function BinarySearch($value, $list){

   $inicioLista = 0;
   $finalLista = $list.Length -1;

   while($inicioLista -le $finalLista){
   
      [int]$meio = (($inicioLista + $finalLista) / 2);
      $chute = $list[$meio];

      if($chute -eq $value){
        Write-Host "Valor encontrado";
        return;
      }

      if($value -gt $chute){
        $inicioLista = $meio +1;
      }
      else{
       $finalLista = $meio -1;
      }
     
   }
}


BinarySearch 6 $lista
