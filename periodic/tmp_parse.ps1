Add-Type -AssemblyName System.Web.Extensions
$path = "C:\Users\Erosi\Desktop\periodic\data\elements.json"
$json = [System.IO.File]::ReadAllText($path)
$serializer = New-Object System.Web.Script.Serialization.JavaScriptSerializer
$serializer.MaxJsonLength = [int]::MaxValue
try {
  $data = $serializer.DeserializeObject($json)
  Write-Output "Parsed OK: $($data.Count)"
  Write-Output ($data[0].Keys -join ', ')
} catch {
  Write-Output "Parse error: $($_.Exception.Message)"
}
