# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/hansblackcat/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

#####################################################################
# Custume Settings Start                                               
#####################################################################
# Kitty settings
if command -v kitty > /dev/null 2>&1; then
	autoload -Uz cominit
	compinit
	# Completion for kitty
	kitty + complete setup zsh | source /dev/stdin
fi

# Change default vim to nvim
if command -v nvim > /dev/null 2>&1; then
	alias vi="nvim"
	alias vim="nvim"
	alias vimdiff="nvim -d"
	export EDITOR=/usr/bin/nvim

fi

# Arch specific
if [[ $(uname) == *"Linux"* ]]; then

	# kime settings
	if command -v kime-indicator > /dev/null 2>&1; then
		export GTK_IM_MODULE=kime
		export QT_IM_MODULE=kime
		export XMODIFIERS=@im=kime
	fi	

	# Keyboard Settings	
	if ! [[ $(ls ~/) == *BigBagKbdTrixXKB* ]]; then
		echo "Make xkb Configure"
		cd ~/
		sudo pacman -Syu --needed --noconfirm git
		git clone https://github.com/DreymaR/BigBagKbdTrixXKB.git
		sudo chmod +x ~/BigBagKbdTrixXKB/*.sh
		~/BigBagKbdTrixXKB/install-dreymar-xmod.sh -xo
		~/BigBagKbdTrixXKB//setxkb.sh -m '4caw' -l 'us(cmk_ed_dh)'
	fi

fi

# Multi-Core Compile Option
export MAKEFLAGS="-j$(nproc)"

# Aliasing
alias cat="bat"

# File Trasnfer
# trasnfer.sh
transfersh_put(){ 
	if [ $# -eq 0 ]; then 
		echo "No arguments specified.\nUsage:\n  transfersh_put <file|directory>\n  ... | transfersh_put <file_name>" >&2
		return 1
	fi

	if tty -s; then
		file="$1"
		file_name=$(basename "$file")

		if [ ! -e "$file" ]; then 
			echo "$file: No such file or directory">&2
			return 1
		fi

		if [ -d "$file" ]; then 
			file_name="$file_name.zip"
			(cd "$file"&&zip -r -q - .) | openssl camellia-256-cbc -pbkdf2 -e | curl -X PUT --socks5-hostname localhost:9050 --progress-bar --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null
		else 
			cat "$file" | openssl camellia-256-cbc -pbkdf2 -e | curl -X PUT --socks5-hostname localhost:9050 --progress-bar --upload-file "-" "https://transfer.sh/$file_name"| tee /dev/null
		fi

	else 
		file_name=$1
		openssl camellia-256-cbc -pbkdf2 -e | curl -X PUT --socks5-hostname localhost:9050 --progress-bar --upload-file "-" "https://transfer.sh/$file_name" | tee /dev/null
	fi;
}
transfersh_get() {
	if [ $# -lt 3 ]; then
		echo "Insufficient arguments specified.\nUsage:\n  transfersh_get <address_hash> <file_name> <object_DIRECTORY>" >&2
		return 1
	fi

	address_hash="$1"
	file_name="$2"
	object_directory="$3"

	echo "Enter Password: "
	curl "https://transfer.sh/$address_hash/$file_name" | openssl camellia-256-cbc -pbkdf2 -d > $object_directory/$file_name
}

## Applications EnvVars
# DoomEmacs
export DOOMDIR="~/.config/doom"
# Python IncludePath Problem
export CPATH=/usr/include/python3.9:$CPATH
# Flutter Env
# CHROME_EXECUTABLE=<path_to_chrome>


#####################################################################
# Custume Settings End                                               
#####################################################################



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



