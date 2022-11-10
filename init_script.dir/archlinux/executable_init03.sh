# ghcup
if ! command -v ghc &> /dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
  # Stack manages GHC versions internally by default. In order to make it use ghcup installed
  stack config set install-ghc false --global
  stack config set system-ghc  true  --global
else
  echo "ghc(up) already exists -- skipping"
fi
