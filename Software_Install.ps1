# Base Software Path
$ScriptPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$SoftwareFolderPath = "$($ScriptPath)/Software"

# Software Download Links
#Always remember to put comma for each line except the final line
$softwareInstalled = @(
    #Enter your File name here

    "Chrome.exe",
    "AReader.exe",
    "OfficeSetup.exe"
    
)

function InstallSoftware {
    param (
        [string]$FileName
    )
    
    $filePath = "$SoftwareFolderPath\$FileName"
    
    $fileExtension = [System.IO.Path]::GetExtension($FileName)
    
    switch ($fileExtension) {
        '.exe' {
            Start-Process -FilePath $filePath -Wait
        }
        '.msi' {
            $arguments = "/i `"$filePath`" /quiet /norestart"
            Start-Process -FilePath "msiexec.exe" -ArgumentList $arguments -Wait
        }
        default {
            Write-Host "Unsupported file type for $FileName"
        }
    }
}

# Start software downloads
foreach ($i in $softwareInstalled) {
    InstallSoftware -Filename $i -wait
    write-host "$i install completed."   "`n"
}
