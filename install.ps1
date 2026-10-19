# Installs Partner Copilot 0.14.1, or updates to it: the helper in %USERPROFILE%\.gauntlet-copilot\app,
# and the extension in %USERPROFILE%\.gauntlet-copilot\extension, the folder you load in Chrome once.
#   irm https://github.com/NickHarder/partner-copilot/releases/latest/download/install.ps1 | iex
# GAUNTLET_COPILOT_RELEASE_URL downloads another release's files (in tests, a folder on this computer).
#
# Plain ASCII, since `irm` reads it in whatever encoding it guesses. Nothing at the top level but one
# function and its call: `iex` runs this in your own PowerShell session, so an `exit` here would close
# it, and a download of this script that's cut short runs nothing. A failure leaves $LASTEXITCODE at 1.

function Install-PartnerCopilot {
  $ErrorActionPreference = 'Stop'
  # Windows PowerShell's progress bar makes a download take many times longer.
  $ProgressPreference = 'SilentlyContinue'
  $global:LASTEXITCODE = 1

  # A file of the release: downloaded, or copied from a folder on this computer (tests).
  function Get-ReleaseFile([string] $from, [string] $to) {
    if ($from -match '^file:') { $from = ([Uri] $from).LocalPath }
    if ($from -notmatch '^https?:') {
      Copy-Item -LiteralPath $from -Destination $to
      return
    }
    Invoke-WebRequest -Uri $from -OutFile $to -UseBasicParsing
  }

  try {
    if ($PSVersionTable.PSVersion.Major -ge 6 -and -not $IsWindows) {
      throw "This installer is for Windows. On a Mac or Linux, in a terminal: curl -fsSL https://github.com/NickHarder/partner-copilot/releases/latest/download/install.sh | sh"
    }
    # CI's Windows runners are administrators: GAUNTLET_COPILOT_ALLOW_ADMIN lets its smoke test through.
    $user = [Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()
    if ($user.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -and -not $env:GAUNTLET_COPILOT_ALLOW_ADMIN) {
      throw "Run this as yourself, in a PowerShell that isn't 'Run as administrator'."
    }
    if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
      throw "Partner Copilot needs Node 22 or later: https://nodejs.org"
    }
    $nodeVersion = (& node -p 'process.versions.node')
    if ($LASTEXITCODE -ne 0 -or [int] (($nodeVersion -split '\.')[0]) -lt 22) {
      throw "Partner Copilot needs Node 22 or later (you have $nodeVersion): https://nodejs.org"
    }
    $claude = $env:GAUNTLET_COPILOT_CLAUDE_BIN
    if (-not $claude) { $claude = 'claude' }
    if (-not (Get-Command $claude -ErrorAction SilentlyContinue)) {
      throw "Partner Copilot needs Claude Code: https://claude.com/claude-code. Install it, run claude, then /login, and run this again."
    }
    # Windows PowerShell may still try TLS 1.0 with GitHub, which answers only TLS 1.2 and up.
    if ($PSVersionTable.PSVersion.Major -lt 6) {
      [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
    }

    $dir = $env:GAUNTLET_COPILOT_HOME
    if (-not $dir) { $dir = Join-Path $env:USERPROFILE '.gauntlet-copilot' }
    $url = $env:GAUNTLET_COPILOT_RELEASE_URL
    if (-not $url) { $url = 'https://github.com/NickHarder/partner-copilot/releases/download/v0.14.1' }
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    # Downloaded next to where the files go, so each moves into place with a rename.
    $tmp = Join-Path $dir ('download.' + [IO.Path]::GetRandomFileName())
    New-Item -ItemType Directory -Path $tmp | Out-Null
    try {
      Write-Host 'Downloading Partner Copilot 0.14.1...'
      try {
        Get-ReleaseFile "$url/gauntlet-copilot-cli.js" (Join-Path $tmp 'cli.js')
        Get-ReleaseFile "$url/partner-copilot-extension.zip" (Join-Path $tmp 'extension.zip')
        Expand-Archive -LiteralPath (Join-Path $tmp 'extension.zip') -DestinationPath (Join-Path $tmp 'extension')
        if (-not (Test-Path -LiteralPath (Join-Path $tmp 'extension\manifest.json'))) { throw 'no manifest' }
      } catch {
        # Why, as curl -S would say it, then the same line as install.sh.
        $Host.UI.WriteErrorLine($_.Exception.Message)
        throw "The download didn't work. Try again in a minute."
      }

      # The same paths every time: Chrome loads the extension from this folder, and its launcher runs app\cli.js.
      New-Item -ItemType Directory -Force -Path (Join-Path $dir 'app') | Out-Null
      Move-Item -LiteralPath (Join-Path $tmp 'cli.js') -Destination (Join-Path $dir 'app\cli.js') -Force
      $extension = Join-Path $dir 'extension'
      $old = Join-Path $dir 'extension.old'
      # Removing an old extension folder is best-effort: a file in it something still holds open
      # (the browser, antivirus) mustn't stop the update. One that won't go is moved aside, and
      # tried again by the next run.
      Get-ChildItem -LiteralPath $dir -Directory -Filter 'extension.old*' | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
      if (Test-Path -LiteralPath $old) { Move-Item -LiteralPath $old -Destination ($old + '.' + [IO.Path]::GetRandomFileName()) }
      if (Test-Path -LiteralPath $extension) { Move-Item -LiteralPath $extension -Destination $old }
      Move-Item -LiteralPath (Join-Path $tmp 'extension') -Destination $extension
      Remove-Item -LiteralPath $old -Recurse -Force -ErrorAction SilentlyContinue
    } finally {
      Remove-Item -LiteralPath $tmp -Recurse -Force -ErrorAction SilentlyContinue
    }

    & node (Join-Path $dir 'app\cli.js') install
    if ($LASTEXITCODE -ne 0) { throw "Fix what's marked above, then run the same command again." }
  } catch {
    $Host.UI.WriteErrorLine($_.Exception.Message)
    $global:LASTEXITCODE = 1
    return
  }
  $global:LASTEXITCODE = 0
}

Install-PartnerCopilot
