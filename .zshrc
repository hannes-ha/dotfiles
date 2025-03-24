export TERM=xterm-256color

# Set up the prompt
setopt histignorealldups sharehistory

# aliases
source ~/.aliases

# prompt
# enable git info on zsh
# autoload -Uz vcs_info
# precmd() { vcs_info }
# setopt prompt_subst
# only show branch info
# zstyle ':vcs_info:git:*' formats "%b"
# blue path, grey branch if in repo, red or white > depending on last exit code
# PROMPT='
# %F{blue}%~%f %F{242}${vcs_info_msg_0_:+${vcs_info_msg_0_} }%(?.%F{white}.%F{red})>%f '
eval "$(starship init zsh)"

# fzf shell integration
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
fi

# z
if command -v zoxide 2>&1 > /dev/null; then
    eval "$(zoxide init zsh)"
fi

# zsh-autosuggest
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# Use .config dir for config on MacOS
export XDG_CONFIG_HOME="$HOME/.config"

# local settings go here
if [[ -f ~/.zshrc.locals ]]; then 
  source ~/.zshrc.locals
fi
