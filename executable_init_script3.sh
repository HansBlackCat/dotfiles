sudo apt update

# Haskell
# ghcup
sudo apt install build-essential curl libffi-dev libffi7 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5 -y
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# Stack manages GHC versions internally by default. In order to make it use ghcup installed
stack config set install-ghc false --global
stack config set system-ghc  true  --global


