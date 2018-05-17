source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Supports oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-flow", from:oh-my-zsh
zplug "plugins/composer", from:oh-my-zsh 
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Can manage local plugins
#zplug "~/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

export TERM=xterm-256color

# Path to your oh-my-zsh installation.

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Font mode for powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'

prompt_zsh_showSpotify () {
  local color='%F{red}'
  state=`spotify-cli now-playing`;
  if [ $state = "Spotify service not found - is it running?" ]; then

  else
    artist=`spotify-cli now-playing | grep "spotify_artist_name" | cut -d'=' -f2 | cut -d '"' -f2`
    track=`spotify-cli now-playing | grep "spotify_track_name" | cut -d'=' -f2 | cut -d '"' -f2`

    echo -n "%{$color%}\uf1bc $artist - $track " ;
  fi
}

# Prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='\uf0da'
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{black}%F{green} \uf155%f%F{black} %k\ue0b0%f "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(custom_spotify time)
POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073 %m/%d/%y}"
POWERLEVEL9K_CUSTOM_SPOTIFY="prompt_zsh_showSpotify"
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

# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

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
alias php.ini='sudo vim /opt/lampp/etc/php.ini'

#[program]
alias xampp='sudo /opt/lampp/manager-linux-x64.run&'
alias dropbox='python ~/dropbox.py'
alias lyrics='~/lyricfier-linux-x64/lyricfier&'
alias postman='~/Postman/Postman&'

#[system]
alias s='sudo'
alias sai='sudo apt install'
alias sar='sudo apt remove --auto-remove --purge'
alias saud='sudo apt update'
alias saug='sudo apt upgrade -y'

#[cd]
alias dl='~/下載'

#[dir]
hash -d lampp='/opt/lampp'
hash -d htdocs='/opt/lampp/htdocs'
hash -d osm='/opt/lampp/htdocs/osm'
hash -d dropbox=$HOME/Dropbox
hash -d dl='/home/rexliu/下載'
hash -d aurora='/home/rexliu/.conky/Aurora'

#[other]
alias xc='xclip -sel clip'
alias vz='vim ~/.zshrc'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

#[jekyll]
alias brain='bundle exec jekyll serve'
alias cloneguake='tablabel=`guake -l` && guake -n `pwd` && guake -r $tablabel'
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
. /home/rexliu/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Then, source plugins and add commands to $PATH
zplug load --verbose
