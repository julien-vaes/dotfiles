# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jvaes/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/jvaes/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jvaes/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/jvaes/.fzf/shell/key-bindings.zsh"
