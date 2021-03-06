source ~/.zprofile
#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# For using BAT as pager
export BAT_THEME="Nord"
export BAT_PAGER="less -RF"

ZSH=/usr/share/oh-my-zsh/
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

ZSH=/usr/share/oh-my-zsh/
source $ZSH/oh-my-zsh.sh

export BROWSER="qutebrowser"
export LANG=en_US.UTF-8
export TERM="xterm-256color"
export COLORTERM="truecolor"
# If you come from bash you might have to change your $PATH.
export PATH=/home/jan-pieter/.gem/ruby/2.6.0/bin:/home/jan-pieter/jetbrains-scripts:$PATH
export PATH="$PATH:/home/jan-pieter/.dotnet/tools"
export PATH="$PATH:$(pyenv root)/shims"
export PATH="$PATH:$HOME/.npm/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  github
  pass
  dircycle
  dirhistory
  systemd
  git
)

source $HOME/.alias

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi
#export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(host dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs battery time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_MULTILINE_FIRST_PROMT_PREFIX=''

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

source $ZSH/plugins/git/git.plugin.zsh

# fix pandoc completions
autoload bashcompinit
bashcompinit
eval "$(pandoc --bash-completion)"

# fix hub completions
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

source /usr/share/autojump/autojump.zsh

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export HISTSIZE=100000
export HISTFILESIZE=$HISTSIZE
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE
setopt SHARE_HISTORY

export LC_ALL=en_GB.UTF-8

# redpencil mu cli
autoload -U +X bashcompinit && bashcompinit
PATH="/home/jan-pieter/git_repos/_RedpencilIO/mu-cli/:$PATH"
source /home/jan-pieter/git_repos/_RedpencilIO/mu-cli/completions
eval "$(rbenv init - zsh)"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

source ~/.zshrc-private
source ~/.git-alias
