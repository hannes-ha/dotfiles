export TERM=xterm-256color

# Set up the prompt
setopt histignorealldups sharehistory

# aliases
source ~/.aliases

# pure prompt
source ~/.pure_prompt

# fzf shell integration
if command -v fzf &> /dev/null && [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
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

# run tmux if not in vscode
if command -v tmux &> /dev/null && [ -z "$TMUX" ] && [[ $TERM_PROGRAM != vscode && $TERM_PROGRAM != zed ]]; then
  tmux attach-session -t default || tmux new-session -s default
fi

# Vim as default editor
export VISUAL=vim
export EDITOR="$VISUAL"

# local settings go here
if [[ -f ~/.zshrc.locals ]]; then 
  source ~/.zshrc.locals
fi
