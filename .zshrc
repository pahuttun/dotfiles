### Aliases

# Better ls
alias ll='ls -lG'
alias la='ls -laG'
alias ls='ls -lG'

# Show/hide files
alias showDotFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideDotFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

### Paths

export PATH=$PATH

### Git completion

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

### Git prompt

#GIT_PROMPT_ONLY_IN_REPO=1
#if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
#    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
#    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
#fi

### Customize prompt
# Short explanation of commands:
#   %@ = The time, in 12-hour am/pm format
#   %~ = The current working directory
#   %s = The current branch (if any)
#   %(!.#.$) = If you are root, inserts #, otherwise $

source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWUPSTREAM="verbose"
setopt PROMPT_SUBST ; PS1='%F{10}%@%f %F{12}%~%f$(__git_ps1 " (%s)") %(!.#.$) '

### iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
