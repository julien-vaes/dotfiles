PROMPT="--> %"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export PATH=$PATH:/Users/nvdbconsulting/Library/Python/3.11/bin


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -Uz compinit && compinit
source /Users/nvdbconsulting/fzf-marks/fzf-marks.plugin.bash

export MISTRAL_API_KEY='koG7EkdmPlV630GhTdC0kOOKmUuiYDqd'
export OPEN_API_KEY='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'
