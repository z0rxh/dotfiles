# Fix the Java Problem
export _JAVA_AWT_WM_NONREPARENTING=1

# Set up the prompt
autoload -Uz colors
colors
setopt PROMPT_SUBST

PROMPT=$'%{$fg[red]%}┌─%(?,,%{$fg[red]%}[%{$fg_bold[red]%}✗%{$reset_color%}%{$fg[red]%}]─)[%{$fg_bold[green]%}%n%{$reset_color%}%{$fg_bold[yellow]%}@%{$fg_bold[cyan]%}%m%{$reset_color%}%{$fg[red]%}]─[%{$fg[green]%}%~%{$reset_color%}%{$fg[red]%}]
%{$fg[red]%}└──╼ %{$fg_bold[yellow]%}%(!.#.$)%{$reset_color%} '

PS2=$' %{$fg[green]%}|>%{$reset_color%} '

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# path configuration
typeset -U path PATH
path=(
    /root/.local/bin
    /snap/bin
    /usr/sandbox
    /usr/local/bin
    /usr/bin
    /bin
    /usr/local/games
    /usr/games
    /usr/share/games
    /usr/local/sbin
    /usr/sbin
    /sbin
    /opt
)

# manual aliases
alias ls='lsd --group-dirs=first'
alias cat='bat'

# plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh # https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh

# functions
function mkt(){
	mkdir {nmap,content,exploits,scripts}
}

# extract nmap information
function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

function settarget(){
    ip_address=$1
    machine_name=$2
    echo "$ip_address $machine_name" > ~/.config/bin/target
}

function cleartarget(){
    echo '' > ~/.config/bin/target
}

function rmk(){
	scrub -p dod $1
	shred -zun 10 -v $1
}

# bindings
bindkey '^[[3~' delete-char 
bindkey '^[[H'  beginning-of-line
bindkey '^[[F'  end-of-line
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
