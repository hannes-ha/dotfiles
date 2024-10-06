# Setup fzf
# ---------
if [[ ! "$PATH" == */home/hannes/.dotfiles/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/hannes/.dotfiles/.fzf/bin"
fi

source <(fzf --zsh)
