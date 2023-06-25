# N9VEM TERMINAL CONFIGURATION
Note: Directory: "C:\Users\user\.config"

## Step 1: Install Hack Nerd Fonts (Nerd Fonts)
```URL
> https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
```
## Step 2: Change the font to Hack Nerd Font (Defaults)

## Step 3: Change color to One-Half Dark (Defaults)

## Step 4: Enable acrylic material (Defaults)

## Step 5: Enable "Use acrylic material in the tab row" (Appearance)

## Step 6: Install Powershell

## Step 7: Change default to Powershell

## Step 8: Install Scoop
```PowerShell
> Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
> irm get.scoop.sh | iex
```
## Step 9: Create Powershell config directory
```PowerShell
> mkdir .config/powershell
```
## Step 10: Create 'user_profile'
```PowerShell
> nvim .config/powershell/user_profile.ps1
```
## Step 11: Paste code (.config/powershell/user_profile.ps1)
```PowerShell
# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\takuya.omp.json"
# oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
# oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\bubblesextra.omp.json" | Invoke-Expression
oh-my-posh.exe init pwsh --config "C:\Users\Novem\.config\powershell\.themes\bubblesline.omp.json" | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

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

```
