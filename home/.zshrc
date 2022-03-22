# Fig pre block. Keep at the top of this file.
export PATH="${PATH}:${HOME}/.local/bin"
eval "$(fig init zsh pre)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
ZSH_DISABLE_COMPFIX=true
export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

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

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow debian grails rvm history-substring-search github gradle svn node npm sublime composer)
plugins+=(zsh-syntax-highlighting)
#plugins+=(zsh-autosuggestions) conflict with fig!
plugins+=(virtualenv)

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
export LD_LIBRARY_PATH="${HOME}/usr/lib:${LD_LIBRARY_PATH}"
alias iphone='idevicepair pair | ifuse /media/iPhone'
alias uniphone='fusermount -u /media/iPhone'

#[git]
alias gits='git status'
alias gitk='gitk --all&'
alias gita='git add'
alias gita.='git add .'
alias gitc='git commit'

#[php]
#alias phpbrewswitch='bash $HOME/Dropbox/Dev/phpbrew-tool/phpbrewswitch && reload'
export PATH="$PATH:$HOME/composer/vendor/bin"
#[laravel]
alias sail='bash vendor/bin/sail'

#[PATH]
export PATH="$PATH:$HOME/bin"

#[script]
alias youtube-dl="noglob youtube-dl"
alias ydm="youtube-dl -x --audio-format mp3 --embed-thumbnail --add-metadata"
alias lyric="python3 $HOME/Dropbox/Dev/lyrics-crawler/get-lyric.py"
alias 5g1="python3 $HOME/Dropbox/Dev/5g1/5g1/main.py"
alias sgl="python3 $HOME/Dropbox/Dev/sgl/scripts/591/main.py"

#[system]
alias s='sudo'
alias sai='sudo apt install'
alias sar='sudo apt remove'
alias saar='sudo apt autoremove'
alias sarp='sudo apt remove --auto-remove --purge'
alias saud='sudo apt update'
alias saug='sudo apt upgrade -y'

#[dir]
hash -d html='/var/www/html'
hash -d dropbox="$HOME/Dropbox"
hash -d dev="$HOME/OneDrive/Dev"
hash -d dl="$HOME/Downloads"

#[other]
alias xc='xclip -sel clip < '
alias vz='vim ~/.zshrc'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias ifconfig='ip -c a'
alias xclock='xclock -g +0+0 -update 1&'
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias rlf='readlink -f'
alias cpa='cp -avi'
alias rm='rm -vi'
alias mv='mv -vi'
alias ln='ln -vi'
#alias pgstart="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
#alias pgstop="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist"
#alias pgstatus="pg_ctl status -D /usr/local/var/postgres/"
#echo "start/stop postgres pgstart and pgstop, status= pgstatus"
#echo ""

#[jekyll]
alias bejs='bundle exec jekyll serve'

#[thefuck]
#eval "$(thefuck --alias)"

# Weather in terminal
function weather ()
{
    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Taipei}?${2:-0q}"
}

#[OPAM]
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

#[go]
export GO111MODULE=on
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

#[Ruby Gems]
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

#[Remap CapsLock to Ctrl]
#setxkbmap -option ctrl:nocaps

#[PHPBrew]
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc

#[Hub]
eval "$(hub alias -s)"

#[Github Token]
if [[ -f $HOME/.github_token ]]
then
  export GiTHUB_TOKEN=$(cat $HOME/.github_token)
fi

#[Flameshot]
alias fs='flameshot gui -d 3000'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#[Anaconda]
#source $HOME/anaconda3/etc/profile.d/conda.sh

#[Homebrew Command Not Found]
if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
export PATH="/usr/local/opt/ruby/bin:$PATH"

#[z]
. /usr/local/etc/profile.d/z.sh

#[ffmpeg]
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig post block. Keep at the bottom of this file.
eval "$(fig init zsh post)"

