# ZSH configure file

setopt autocd              # change directory just by typing its name
#setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makessense
setopt promptsubst         # enable command substitution in prompt 

WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word

## History file configuration 
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=50000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# configure key keybindings
bindkey -e                                       # emacs key bindings
bindkey ' ' magic-space                          # [Space] - don't do history expansion
bindkey '^U' backward-kill-line                  # ctrl + U
bindkey '^[[3;5~' kill-word                      # ctrl + Supr
bindkey '^[[3~' delete-char                      # delete
bindkey '^[[1;5C' forward-word                   # ctrl + ->
bindkey '^[[1;5D' backward-word                  # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history   # page up
bindkey '^[[6~' end-of-buffer-or-history         # page down
bindkey '^[[H' beginning-of-line                 # home
bindkey '^[[F' end-of-line                       # end
bindkey '^[[Z' undo                              # shift + tab undo last action

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# enable auto-suggestions
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
     . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# enable syntax-highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
     . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
eval "$(starship init zsh)"
