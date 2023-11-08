# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Import-Module posh-git`~
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
# oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# themes my poshy
# oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\bubblesextra.omp.json" | Invoke-Expression
# oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\bubblesline.omp.json" | Invoke-Expression
# oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\cloud-context.omp.json" | Invoke-Expression
# oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\easy-term.omp.json" | Invoke-Expression
# oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\jblab_2021.omp.json" | Invoke-Expression
# oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\microverse-power.omp.json" | Invoke-Expression
oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\multiverse-neon.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionSource ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

