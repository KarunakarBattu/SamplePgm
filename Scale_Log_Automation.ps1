cls

#Give the folder path that has list of files
$Files = Get-ChildItem -Path "E:\Logs_Path" -Recurse

$xl=New-Object -ComObject Excel.Application

#Give excel path to write into it
$xl.Workbooks.Open("E:\FileData1.xlsx")
$ws=$xl.Worksheets.item(1)
$xl.Visible=$true
$xl.DisplayAlerts =$false

$k = 2


#Give all parameters you want to search in files
$params =  "Test Started: AssessmentEndToEndTest","Test Succeeded: TestPutVCenter","Test Succeeded: WaitForSDSDiscoveryCompletion","Test Succeeded: WaitForSASDiscoveryCompletion",
"Test Succeeded: CreateGroupAndAssessment","Test Succeeded: WaitForAMHAssessmentCountMatch","Time taken for creating assessment Assessment","Time taken for discovery","Time taken for assessment count"
$ws.Cells(1,1) = "File Name"
foreach($File in $Files){
$File_Name = $File.Name;
    $ws.Cells($k,1)= $File_Name.SubString(13,19)
    $l = 2
    for($i = 0; $i -le $params.Count-1; $i++){
       # $ws.Cells(1,$l) = $params[$i];
       $ws.Cells(1,$l) = "T" + $i
        $FileContent = Get-Content -Path $File.FullName | Where-Object {$_.Contains($params[$i])}
        if($FileContent -ne $null){       
           switch($i){
           #Give parameter number and substring as per below example
           #2 is the parameter number and 12,5 is the substring

           default {$ws.Cells($k,$i+2) = $FileContent.Substring(12,8)}
                      6 {$ws.Cells($k,$i+2) = $FileContent.Substring(237,2) }
                      7 {$ws.Cells($k,$i+2) = $FileContent.Substring(198,5) }
                      8  {$ws.Cells($k,$i+2) = $FileContent.Substring(211,1) }
               }      
        }
        $l++;
    }
    $k++;
}
#$wb.Save();
#$xl.Quit();
$xl.Activeworkbook.Save();

$xl.Quit();