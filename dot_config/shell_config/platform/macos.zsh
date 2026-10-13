export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"

# Use Homebrew for eza on macOS. Existing Homebrew skips installation.
() {
  local brew_bin installer
  local installed_homebrew=0

  if [[ -x /opt/homebrew/bin/brew ]]; then
    brew_bin=/opt/homebrew/bin/brew
  elif [[ -x /usr/local/bin/brew ]]; then
    brew_bin=/usr/local/bin/brew
  elif (( $+commands[brew] )); then
    brew_bin=$commands[brew]
  else
    installer="$(command curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || return 1
    /bin/bash -c "$installer" || return 1
    installed_homebrew=1

    if [[ -x /opt/homebrew/bin/brew ]]; then
      brew_bin=/opt/homebrew/bin/brew
    elif [[ -x /usr/local/bin/brew ]]; then
      brew_bin=/usr/local/bin/brew
    else
      print -u2 'Homebrew installation did not produce a brew executable.'
      return 1
    fi
  fi

  eval "$("$brew_bin" shellenv)"
  if (( installed_homebrew )); then
    "$brew_bin" install eza
  fi
}
