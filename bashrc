[[ -s "$HOME/.termfunc" ]] && source "$HOME/.termfunc"

umask 002

# reset terminal
export CLICOLOR=1
export TERM=xterm-256color
tput init

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

# Set flags for development
export ARCHFLAGS="-arch x86_64"
export ES_HEAP_SIZE="4096m"

# paths
export USER_LOCAL_HOME="$HOME/local"
export ANDROID_STUDIO="$HOME/Development/android/studio"
export ANDROID_HOME="$HOME/Development/android/sdk"
export DEPOT_TOOLS="$USER_LOCAL_HOME/depot_tools"
export EMACS_HOME="/opt/emacs"
#export GOPATH="$HOME/Development/go"
#export GOROOT="/usr/local/go"

#export JAVA_HOME="/usr/lib/jvm/default-java"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0.jdk/Contents/Home"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home"
export JAVA_LIBS="$USER_LOCAL_HOME/lib/java"

export RCX_PORT="usb"
export CHRUBY_HOME="/usr/local/opt/chruby"

export SBT_OPS="-Xmx2048m -XX:MaxPermSize=2048m -XX:+CMSClassUnloadingEnabled"
export SCALA_HOME="/opt/scala/current"
export IDEA_PATH="/opt/idea-ic"

# if on OS X, some paths are set by path_helper from /etc/paths and /etc/paths.d
if [ "$OSTYPE" == "darwin"* ]; then
    eval `/usr/libexec/path_helper`
fi

prefix_path_if_exists "$ANDROID_STUDIO/bin"
prefix_path_if_exists "/usr/local/sbin"
prefix_path_if_exists "$USER_LOCAL_HOME/bin"
prefix_path_if_exists "$ANDROID_HOME/tools"
prefix_path_if_exists "$ANDROID_HOME/platform-tools"
prefix_path_if_exists "$DEPOT_TOOLS"
prefix_path_if_exists "$JAVA_HOME/bin"
prefix_path_if_exists "$JAVACC_HOME/bin"
prefix_path_if_exists "$GOPATH/bin"
prefix_path_if_exists "$EMACS_HOME/bin"
prefix_path_if_exists "$SCALA_HOME/bin"
prefix_path_if_exists "$IDEA_PATH/bin"

[[ -s "$CHRUBY_HOME/share/chruby/chruby.sh" ]] && source "$CHRUBY_HOME/share/chruby/chruby.sh"
[[ -s "$CHRUBY_HOME/share/chruby/auto.sh" ]] && source "$CHRUBY_HOME/share/chruby/auto.sh"

# settings to keep IntelliJ working. https://youtrack.jetbrains.com/issue/IDEA-78860
export IBUS_ENABLE_SYNC_MODE=1
