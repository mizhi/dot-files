export TERM=xterm-256color

# pick the best installed editor
editor_prefs=(emacs vim vi nano pico ed)
for ed in "${editor_prefs[@]}"; do
    which $ed > /dev/null 2>&1 && export EDITOR=$(which $ed) && break
done
export VISUAL=$EDITOR


# shell prompt stuff
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
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
   if [ "$color_prompt" = yes ]; then
      PS1=$PS1'$(__git_ps1 "\[\033[00m\]:\[\033[1;33m\]%s")'
   else
      PS1=$PS1'$(__git_ps1 ":%s")'
   fi
fi

[[ -s "$HOME/.git-completion.sh" ]] && source "$HOME/.git-completion.sh"

[[ -s "$HOME/.aliases" ]] && source "$HOME/.aliases"


# Set flags for development
export ARCHFLAGS="-arch x86_64"
export CFLAGS="-Qunused-arguments"
export CPPFLAGS="-Qunused-arguments"

export ES_HEAP_SIZE="4096m"
export SBT_OPS="-XX:MaxPermSize=2048m -XX:+CMSClassUnloadingEnabled"


# ruby stuff
if [ -d $HOME/.rvm ]; then
	export PATH="$PATH:$HOME/.rvm/bin"
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"