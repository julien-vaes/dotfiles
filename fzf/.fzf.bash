# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jvaes/dotfiles/fzf/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/jvaes/dotfiles/fzf/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jvaes/dotfiles/fzf/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/jvaes/dotfiles/fzf/.fzf/shell/key-bindings.bash"
