# Check admin rights
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run PowerShell as Administrator." -ForegroundColor Yellow
}

# Try to get the service
try {
    $service = Get-Service -Name 'MSSQL$SQLEXPRESS' -ErrorAction Stop
}
catch {
    Write-Host "Service not found or inaccessible: $_" -ForegroundColor Red
    exit 1
}

switch ($service.Status) {
    'Running' {
        Write-Host "Stopping $($service.Name)..."
        $service = Stop-Service -Name $service.Name -PassThru
        $service.WaitForStatus('Stopped', '00:00:20')
        Write-Host "Service stopped."
    }
    'Stopped' {
        Write-Host "Starting $($service.Name)..."
        $service = Start-Service -Name $service.Name -PassThru
        $service.WaitForStatus('Running', '00:00:20')
        Write-Host "Service started."
    }
    default {
        Write-Host "Service is in an unexpected state: $($service.Status)"
    }
}

Read-Host -Prompt "Press Enter to exit"
