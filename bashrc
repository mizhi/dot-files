# reset terminal
export CLICOLOR=1
export TERM=xterm-256color

tput init
umask 002

# This setting is so that I can use Ctrl-Q as the prefix keys for tmux.
stty stop undef

[[ -s "$HOME/.termfunc" ]] && source "$HOME/.termfunc"

export PS1="\[$clear\][\[$cyan\]\!\[$clear\]] \u\[$lightblue\]@\[$clear\]\h:\w\\[$clear\]"

# pick the best installed editor
EDITOR_PREFS=(emacs vim vi nano pico ed)
for ed in "${EDITOR_PREFS[@]}"; do
    which $ed > /dev/null 2>&1 && export EDITOR=$(which $ed) && break
done
export VISUAL=$EDITOR
export HGEDITOR="/usr/bin/vim"

# shell prompt stuff
FORCE_COLOR_PROMPT=yes

if [ -n "$FORCE_COLOR_PROMPT" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        COLOR_PROMPT=yes
    else
        COLOR_PROMPT=
    fi
fi

# git configuration
# for __git_ps1
if [ -s "$HOME/.git-prompt.sh" ]; then
   source "$HOME/.git-prompt.sh"

   # Indicate when there are staged/unstaged changes
   GIT_PS1_SHOWDIRTYSTATE=yes

   # Indicate when there are untracked files
   GIT_PS1_SHOWUNTRACKEDFILES=yes

   # Indicate the state compared to the upstream branch
   GIT_PS1_SHOWUPSTREAM=yes

   # Append __git_ps1 to show git status
   if [ "$COLOR_PROMPT" = yes ]; then
      PS1=$PS1' [$(__git_ps1 "\[$brown\]%s\[$clear\]")]\[$lightblue\]\$\[$clear\] '
   else
      PS1=$PS1'[$(__git_ps1 "%s")]$ '
   fi
fi

[[ -s "$HOME/.git-completion.sh" ]] && source "$HOME/.git-completion.sh"

[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"
[[ -s "$HOME/.functions" ]] && source "$HOME/.functions"
[[ -s "$HOME/.local-aliases" ]] && source "$HOME/.local-aliases"
[[ -s "$HOME/.local-settings" ]] && source "$HOME/.local-settings"

prefix_path_if_exists "/usr/local/sbin"

# Various tools put bash completion stuff in places
export BASH_COMPLETION_PATH="/usr/local/etc/bash_completion.d"
for f in $BASH_COMPLETION_PATH/*; do
    [[ -s "$f" ]] && source "$f"
done

