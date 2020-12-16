set fish_greeting # Get rid of greeting stuff

# Environments
set -x EDITOR                   nvim
set -x VISUAL                   nvim
set -x LANG                     en_US.UTF-8
set -x LC_ALL                   en_US.UTF-8
set -x XDG_CONFIG_HOME          $HOME/.config
set -x XDG_DATA_HOME            $HOME/.local/share
set -x XDG_CACHE_HOME           $HOME/.cache

# Paths
test -d ~/.local/bin; and set -x PATH ~/.local/bin $PATH 
test -d ~/.pyenv/bin; and set -x PATH ~/.pyenv/bin $PATH 
test -d ~/.npm-global/bin; and set -x PATH ~/.npm-global/bin $PATH

# Fuzzy Finder
set -x FZF_LEGACY_KEYBINDINGS   1
set -x FZF_TMUX                 1
set -x FZF_DEFAULT_COMMAND      "rg . --files"
set -x FZF_DEFAULT_OPTS         '--color=dark,fg:-1,bg:-1,hl:#c678dd,fg+:#ffffff,bg+:#4b5263,hl+:#d858fe,info:#98c379,prompt:#61afef,pointer:#be5046,marker:#e5c07b,spinner:#61afef,header:#61afef'
set -x FZF_CTRL_T_COMMAND       $FZF_DEFAULT_COMMAND
set -x FZF_OPEN_COMMAND         $FZF_DEFAULT_COMMAND

# Prompt
starship init fish              | source

# Python Environments
status --is-interactive;pyenv init -              | source
status --is-interactive;pyenv virtualenv-init -   | source

# Vi bindings
set -g fish_key_bindings fish_vi_key_bindings

# Aliases
alias vi="nvim"
alias vim="nvim"
# alias tmux="env TERM=screen-256color tmux"
alias scim="sc-im"

# test -e $VIRTUAL_ENV; and source $VIRTUAL_ENV/bin/activate.fish 

if status is-interactive
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end
