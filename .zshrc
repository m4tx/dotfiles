# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

DEFAULT_USER="m4tx"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.zsh-custom

# zplugin begin
source $HOME/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
export ZSH=$HOME/.zplugin/
mkdir -p $HOME/.zplugin/cache

zplugin snippet OMZ::lib/clipboard.zsh
zplugin snippet OMZ::lib/compfix.zsh
zplugin snippet OMZ::lib/completion.zsh
zplugin snippet OMZ::lib/correction.zsh
zplugin snippet OMZ::lib/directories.zsh
zplugin snippet OMZ::lib/git.zsh
zplugin snippet OMZ::lib/grep.zsh
zplugin snippet OMZ::lib/history.zsh
zplugin snippet OMZ::lib/key-bindings.zsh
zplugin snippet OMZ::lib/spectrum.zsh
zplugin snippet OMZ::lib/termsupport.zsh
zplugin snippet OMZ::lib/theme-and-appearance.zsh

zplugin snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zplugin snippet OMZ::plugins/git/git.plugin.zsh
zplugin ice as"completion"
zplugin snippet OMZ::plugins/django/django.plugin.zsh
zplugin ice as"completion"
zplugin snippet OMZ::plugins/docker/_docker
zplugin ice as"completion"
zplugin snippet OMZ::plugins/npm/npm.plugin.zsh
zplugin snippet OMZ::plugins/pip/pip.plugin.zsh
zplugin snippet OMZ::plugins/python/python.plugin.zsh
zplugin snippet OMZ::plugins/per-directory-history/per-directory-history.zsh
zplugin snippet OMZ::plugins/sudo/sudo.plugin.zsh
zplugin snippet OMZ::plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh
zplugin snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
zplugin snippet OMZ::plugins/systemd/systemd.plugin.zsh
zplugin snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zplugin snippet OMZ::plugins/gradle/gradle.plugin.zsh
zplugin snippet OMZ::plugins/urltools/urltools.plugin.zsh
zplugin snippet OMZ::plugins/encode64/encode64.plugin.zsh

zplugin ice from"gh"

zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-syntax-highlighting
# zplugin end

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Theme
eval "$(starship init zsh)"

export WORKON_HOME=$HOME/projects/venvs

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
alias vim="nvim"
alias vimdiff="nvim -d"
alias ls="ls --hyperlink --color=tty"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases
# For a full list of active aliases, run `alias`.
alias update-config="curl -Ss https://raw.githubusercontent.com/m4tx/dotfiles/master/install.sh | sh"
alias git-update-patch="git commit --amend --no-edit && git review"
alias git-update-patch-all="git commit -a --amend --no-edit && git review"
alias git-fast-clone="git clone --single-branch --depth 1 --recursive"
alias removeexif="exiftool -all="
alias vimrc="$EDITOR ~/.config/nvim/init.vim"

# Functions
function swap()
{
    local TMPFILE=tmp.$$
    mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE $2
}

function wordfrequency() {
  awk '
     BEGIN { FS="\S+" } {
         for (i=1; i<=NF; i++) {
             word = tolower($i)
             words[word]++
         }
     }
     END {
         for (w in words)
              printf("%3d %s\n", words[w], w)
     } ' | sort -rn
}

autoload -U compinit
compinit

# Local aliases
source $HOME/.local_aliases
