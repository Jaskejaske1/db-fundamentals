# --- Toggle-SQLExpress.ps1 ---
# Smart SQL Server Express toggle script with auto-elevation
# Works standalone or via .bat launcher

# Service name
$ServiceName = 'MSSQL$SQLEXPRESS'

# Function: check admin privileges
function Test-Admin {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Function: self-elevate if not admin
function Start-AdminElevation {
    if (-not (Test-Admin)) {
        Write-Host "Elevating to Administrator..."
        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = "powershell.exe"
        $psi.Arguments = "-ExecutionPolicy Bypass -File `"$PSCommandPath`""
        $psi.Verb = "runas"  # triggers UAC prompt
        try {
            [System.Diagnostics.Process]::Start($psi) | Out-Null
        }
        catch {
            Write-Host "Elevation canceled or failed." -ForegroundColor Red
        }
        exit
    }
}

Start-AdminElevation

# Try to get the service
try {
    $service = Get-Service -Name $ServiceName -ErrorAction Stop
}
catch {
    Write-Host "Service '$ServiceName' not found." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

# Ask and toggle
switch ($service.Status) {
    'Running' {
        Write-Host "SQL Server is currently RUNNING."
        $confirm = Read-Host "Do you want to STOP it? (Y/N)"
        if ($confirm -match '^[Yy]$') {
            Write-Host "Stopping service..."
            Stop-Service -Name $ServiceName -PassThru | Out-Null
            (Get-Service -Name $ServiceName).WaitForStatus('Stopped', '00:00:15')
            Write-Host "SQL Server stopped."
        }
        else {
            Write-Host "No changes made."
        }
    }
    'Stopped' {
        Write-Host "SQL Server is currently STOPPED."
        $confirm = Read-Host "Do you want to START it? (Y/N)"
        if ($confirm -match '^[Yy]$') {
            Write-Host "Starting service..."
            Start-Service -Name $ServiceName -PassThru | Out-Null
            (Get-Service -Name $ServiceName).WaitForStatus('Running', '00:00:15')
            Write-Host "SQL Server started."
        }
        else {
            Write-Host "No changes made."
        }
    }
    default {
        Write-Host "Service is in state '$($service.Status)'. Try again later."
    }
}

Read-Host -Prompt "Press Enter to exit"
