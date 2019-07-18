### Commented out shit

# set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#    xterm-color) color_prompt=yes;;
#esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#   fi
#fi

# Git branch in good-looking prompt.
#parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)\[$(tput sgr0)\] $ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt


# Prompt with Git branch
# Explanation of the weird lines: \u Username, \h Host, \w Path, tput setaf is the color definition

#export PS1='\[$(tput setaf 7)\]\u@\[$(tput setaf 2)\]\h:\[$(tput setaf 4)\]\w\[$(tput setaf 1)\]$(parse_git_branch)\[$(tput sgr0)\] $ '

# Bonus track: SSH autocompleting hostnames, write ssh and press tab
#complete -W "$(while read line; do echo ${line%%[, ]*}; done < ~/.ssh/known_hosts)" ssh

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac

# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert

#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

### Old Git complete

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# Add git complete
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi



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

GIT_PROMPT_ONLY_IN_REPO=1
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi

### Git fancyness
# Short explanation of commands:
# source =      insert sourcecode from given file to here
#               make sure that file exists and can be accessed
#               try to copy to your home dir if still problems
# sources       git-completion.bash: enables git completion
#               git-prompt.sh: enables __git_ps1 command, which is used in prompt
# export PS1 =  Configure prompt
#               \[\033[01;32m\] is color code
#               __git_ps1 is function, which is available after sourcing git-prompt.sh

#export PS1='\[\033[01;32m\]\@\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
export PS1='\[\033[01;32m\]\@\[\033[01;34m\] \w \$\[\033[00m\] '
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
