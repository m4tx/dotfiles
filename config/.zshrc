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

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit begin
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/compfix.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/correction.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/grep.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/spectrum.zsh
zinit snippet OMZ::lib/termsupport.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh

zinit snippet OMZ::plugins/common-aliases/common-aliases.plugin.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit ice as"completion"
zinit snippet OMZ::plugins/docker/_docker
zinit ice as"completion"
zinit snippet OMZ::plugins/npm/npm.plugin.zsh
zinit snippet OMZ::plugins/pip/pip.plugin.zsh
zinit snippet OMZ::plugins/python/python.plugin.zsh
zinit snippet OMZ::plugins/per-directory-history/per-directory-history.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet OMZ::plugins/virtualenvwrapper/virtualenvwrapper.plugin.zsh
zinit snippet OMZ::plugins/archlinux/archlinux.plugin.zsh
zinit snippet OMZ::plugins/systemd/systemd.plugin.zsh
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
zinit snippet OMZ::plugins/gradle/gradle.plugin.zsh
zinit snippet OMZ::plugins/urltools/urltools.plugin.zsh
zinit snippet OMZ::plugins/encode64/encode64.plugin.zsh

zinit ice from"gh"

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# zinit end

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
