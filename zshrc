# Powerlevel10k
	if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
	fi

	[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
	source ~/.oh-my-zsh/powerlevel10k/powerlevel10k.zsh-theme

# Desactivar updates
	DISABLE_AUTO_UPDATE="true"

# Cache de completado
	zstyle ':completion:*' use-cache on
	zstyle ':completion:*' cache-path ~/.zsh/cache
	
# Paths
	export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH
	export ZSH=$HOME/.oh-my-zsh

# Themas oh-my-zsh
	# ZSH_THEME="evan"
	# ZSH_THEME="powerlevel10k/powerlevel10k"

# Functions
	function hexd() {
		echo "$@" | xxd -p -r
	}

	function b64() {
		echo "$@" | base64 -d
	}

	function mkt() {
		mkdir {content,nmap,credentials,exploits}
	}

	function varl() {
		local var_name=$1
		local file_name=$2
		local value
		value=$(cat "$file_name")

		eval "$var_name=\"\$value\""
	}

# Aliases
	alias ll='ls -l'
	alias la='ls -la'
	alias cls="clear"
	alias dir='dir --color=auto'
	alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
	alias bat='batcat --theme="Catppuccin Mocha" -l ruby'
	alias stopVpn='sudo killall openvpn'
	alias rmall='sudo rm -r'

# Plugins
	plugins=(
	  zsh-syntax-highlighting
	  zsh-autosuggestions
	)

	source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

	if [ -f /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]; then
	  #source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
	  #zstyle ':autocomplete:tab:*' insert-unambiguous yes
	  #zstyle ':autocomplete:tab:*' widget-style menu-select
	  #zstyle ':autocomplete:*' min-input 1000
	  #bindkey $key[Up] up-line-or-history
	  #bindkey $key[Down] down-line-or-history
	fi

source $ZSH/oh-my-zsh.sh
