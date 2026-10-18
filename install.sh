#!/bin/sh
# Installs Partner Copilot 0.10.0, or updates to it: the helper in ~/.gauntlet-copilot/app, and
# the extension in ~/.gauntlet-copilot/extension, the folder you load in Chrome once.
#   curl -fsSL https://github.com/NickHarder/partner-copilot/releases/latest/download/install.sh | sh
# On Windows, install.ps1 does the same from PowerShell.
# GAUNTLET_COPILOT_RELEASE_URL downloads another release's files (in tests, a file:// folder).
set -eu

fail() {
  echo "$1" >&2
  exit 1
}

# All in a function, so a download of this script that's cut short runs nothing.
main() {
  windows='irm https://github.com/NickHarder/partner-copilot/releases/latest/download/install.ps1 | iex'
  case "$(uname -s)" in
    Darwin | Linux) ;;
    # Git Bash, MSYS2 and Cygwin: Chrome on Windows can't start a helper installed from there.
    *) fail "This installer is for macOS and Linux, not Git Bash or WSL. On Windows, in PowerShell: $windows" ;;
  esac
  # WSL's kernel says so. The helper must run on Windows itself, where Chrome can start it.
  case "$(uname -r)" in
    *[Mm]icrosoft*) fail "This is WSL, where Chrome can't start the helper. On Windows itself, in PowerShell: $windows" ;;
  esac
  [ "$(id -u)" != 0 ] || fail "Run this as yourself, not with sudo."
  command -v node >/dev/null 2>&1 || fail "Partner Copilot needs Node 22 or later: https://nodejs.org"
  node -e 'process.exit(+process.versions.node.split(".")[0] >= 22 ? 0 : 1)' ||
    fail "Partner Copilot needs Node 22 or later (you have $(node --version)): https://nodejs.org"
  command -v "${GAUNTLET_COPILOT_CLAUDE_BIN:-claude}" >/dev/null 2>&1 ||
    fail "Partner Copilot needs Claude Code: https://claude.com/claude-code. Install it, run claude, then /login, and run this again."

  # Not exported: with GAUNTLET_COPILOT_HOME set, the helper would keep your backups in this folder.
  dir=${GAUNTLET_COPILOT_HOME:-$HOME/.gauntlet-copilot}
  url=${GAUNTLET_COPILOT_RELEASE_URL:-https://github.com/NickHarder/partner-copilot/releases/download/v0.10.0}
  (umask 077 && mkdir -p "$dir")
  # Downloaded next to where the files go, so each moves into place with a rename.
  tmp=$(mktemp -d "$dir/download.XXXXXX")
  trap 'rm -rf "$tmp"' EXIT
  trap 'exit 1' HUP INT TERM

  echo "Downloading Partner Copilot 0.10.0…"
  { curl -fsSL "$url/gauntlet-copilot-cli.js" -o "$tmp/cli.js" &&
    curl -fsSL "$url/partner-copilot-extension.tar.gz" -o "$tmp/extension.tar.gz" &&
    mkdir "$tmp/extension" && tar -xzf "$tmp/extension.tar.gz" -C "$tmp/extension" &&
    [ -f "$tmp/extension/manifest.json" ]; } || fail "The download didn't work. Try again in a minute."

  # The same paths every time: Chrome loads the extension from this folder, and its launcher runs app/cli.js.
  mkdir -p "$dir/app"
  mv -f "$tmp/cli.js" "$dir/app/cli.js"
  rm -rf "$dir/extension.old"
  if [ -d "$dir/extension" ]; then mv "$dir/extension" "$dir/extension.old"; fi
  mv "$tmp/extension" "$dir/extension"
  rm -rf "$dir/extension.old"

  node "$dir/app/cli.js" install || fail "Fix what's marked ✗ above, then run the same command again."
}

main
