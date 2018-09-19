export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH=/home/rexliu/.oh-my-zsh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Font mode for powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'

# Set name of the theme to load.
ZSH_THEME="powerlevel9k/powerlevel9k"

#prompt_zsh_showSpotify () {
#  local color='%F{red}'
#  state=`spotify-cli now-playing`;
#  if [ $state = "Spotify service not found - is it running?" ]; then
#
#  else
#    artist=`spotify-cli now-playing | grep "spotify_artist_name" | cut -d'=' -f2 | cut -d '"' -f2`
#    track=`spotify-cli now-playing | grep "spotify_track_name" | cut -d'=' -f2 | cut -d '"' -f2`
#
#    echo -n "%{$color%}\uf1bc $artist - $track " ;
#  fi
#}

# Prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='\uf0da'
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{black}%F{green} \uf155%f%F{black} %k\ue0b0%f "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_spotify time)
#POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %m/%d/%y}"
POWERLEVEL9K_TIME_FORMAT="%D{%m/%d/%y \uf073 %H:%M}"
#POWERLEVEL9K_CUSTOM_SPOTIFY="prompt_zsh_showSpotify"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_ZSH_SHOWSTATUS_BACKGROUND='black'

# Context
DEFAULT_USER=$USER
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=true
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='green'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'
#POWERLEVEL9K_CONTEXT_TEMPLATE="%F{cyan}%n%f"

# Dirs
POWERLEVEL9K_DIR_HOME_BACKGROUND='green'
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='green'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'
#POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='yellow'
#POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

# OS segment
#POWERLEVEL9K_OS_ICON_BACKGROUND="cyan"
#POWERLEVEL9K_OS_ICON_FOREGROUND="black"

# # VCS icons
#POWERLEVEL9K_VCS_GIT_ICON=$''
#POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$''
POWERLEVEL9K_VCS_STAGED_ICON=$'\uf055'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uf421'
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uf00d'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uf0ab '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uf0aa '

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow debian grails rvm history-substring-search github gradle svn node npm zsh-syntax-highlighting sublime composer)
plugins=(zsh-autosuggestions)
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)
source $ZSH/oh-my-zsh.sh
#source $ZSH/plugins/zsh-incremental/incr*.zsh

# User configuration
export EDITOR='vim'

#[libimobiledevice]
[ ! -d "$HOME/usr/src" ] && mkdir -p "$HOME/usr/src"
export PKG_CONFIG_PATH="${HOME}/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
export CPATH="${HOME}/usr/include:${CPATH}"
export MANPATH="${HOME}/usr/share/man:${MANPATH}"
#export PATH="${HOME}/usr/bin:${PATH}"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export LD_LIBRARY_PATH="${HOME}/usr/lib:${LD_LIBRARY_PATH}"
alias iphone='idevicepair pair | ifuse ~/usr/mnt/'
alias uniphone='fusermount -u ~/usr/mnt'

#[git]
alias gits='git status'
alias gitk='gitk --all&'
alias gita='git add'
alias gita.='git add .'
alias gitc='git commit'

#[php]
alias composer='php /opt/lampp/bin/composer.phar'
export PATH="$PATH:$HOME/.composer/vendor/bin"
#alias php.ini='sudo vim /opt/lampp/etc/php.ini'

#[program]
alias xampp='sudo /opt/lampp/manager-linux-x64.run&'
alias dropbox='python ~/dropbox.py'
alias lyricfier="$HOME/lyricfier-linux-x64/lyricfier&"
alias postman="$HOME/Postman/Postman&"

#[script]
alias youtube-dl="noglob youtube-dl"
alias ydm="youtube-dl -x --audio-format mp3 --embed-thumbnail --add-metadata"
alias lyric="python3 $HOME/lyrics-crawler/get-lyric.py"
alias 5g1="python3 $HOME/Dropbox/Dev/5g1/5g1/main.py"

#[system]
alias s='sudo'
alias sai='sudo apt install'
alias sar='sudo apt remove'
alias saar='sudo apt autoremove'
alias sarp='sudo apt remove --auto-remove --purge'
alias saud='sudo apt update'
alias saug='sudo apt upgrade -y'

#[cd]
alias dl='~/下載'

#[dir]
hash -d lampp='/opt/lampp'
hash -d htdocs='/opt/lampp/htdocs'
hash -d html='/var/www/html'
hash -d osm='/opt/lampp/htdocs/osm'
hash -d dropbox="$HOME/Dropbox"
hash -d dl="$HOME/下載"

#[other]
alias xc='xclip -sel clip < '
alias vz='vim ~/.zshrc'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias rmcl='setxkbmap -option ctrl:nocaps'
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

#[jekyll]
alias brain='bundle exec jekyll serve'
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m\a"}
        ;;
esac

# https://github.com/nvbn/thefuck
eval "$(thefuck --alias)"

# Weather in terminal
function weather ()
{
    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Taipei}?${2:-0q}"
}

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH=$PATH:/usr/local/go/bin

# Ruby Gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

# Remap CapsLock to Ctrl
setxkbmap -option ctrl:nocaps

# PHPBrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

