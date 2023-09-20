function Main(){
  $date = Read-Host "Informe a data: exemplo 20230829 (Ano/Mes/Dia)";
  $dateReplace = $date.Replace("/","");
  
  PilhaBats($dateReplace);
  
}

function PilhaBats([string] $date){
  
 Write-Host "`n"
 Write-Host "Aguarde, estamos buscando suas informações..." -Foreground black -Background yellow
 
  $pathFull = "C:\rvs\temp";
  $path = Get-ChildItem $pathFull | Sort-Object -Property LastWriteTime -Descending;
  
   foreach($bats in $path){
    
     $CopyFrom = Join-Path -Path $pathFull -ChildPath $bats;
    
     $CopyTo = "C:\Dor - Bats -Logs\Bats"
     $fileBatRead = Get-Content $pathFull\$bats;
     
   
     $regex = "D:\\[a-zA-Z]+\\[a-zA-Z]+\\([a-zA-Z]+)[a-zA-Z0-9\\.]+"
     $resultRegex = [regex]::match($fileBatRead, $regex);
     $nameFile = $resultRegex.Groups[1].Value; ##aqui pega o nome do arquvo exemplo "Producao"
     
     $fileExist = (Test-Path -Path $resultRegex -PathType Leaf);
    
     
     if($nameFile -eq "Producao" -and $fileExist ){
       
       $contentFile = Get-Content $resultRegex;
      
       $regexDate = "(\d{4}\d{2}\d{2})";
       $regexContentFile = [regex]::Match($contentFile, $regexDate);
       
        if($regexContentFile.Value -eq $date){
             $CopyTo+= "\"+$date+"-"+$NameFile+".bat"


         Copy-Item -Path $CopyFrom -Destination $copyTo
         
         Write-Host "Bat copiada com sucesso para `n [" $CopyTo " ]" -ForegroundColor White;
          break;
          
        } 
       
      }
      
      if(-not $fileExist ){

        $logPath = "C:\Dor - Bats -Logs\LogErro.txt";
        $logEntry = "
          --------------------- 
          $(Get-Date) - Erro na bat: $bats -  Erro: Arquivo $resultRegex --- NÃO EXISTE
          --------------------- ";
        
        $logEntry | Out-File -FilePath $logPath -Append
      }
     
   }
}

Main

Start-Sleep -Seconds 5
