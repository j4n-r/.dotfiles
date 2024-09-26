# Path to your oh-my-zsh installation.
# export HYPRLAND_USE_HYPRGAMMA=1

export ZSH="$HOME/.oh-my-zsh"

 ZSH_THEME=""

ZSH_THEME="robbyrussell"

plugins=(git fzf colored-man-pages)

source $ZSH/oh-my-zsh.sh

# User configuration



### Keybindings
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias ll="ls -la"
alias python="python3"
alias fzfd="fzf -dir"
alias vim="nvim"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH=$HOME/.local/bin:$PATH
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
eval "$(starship init zsh)"

# -------------------------
# Basic Git Commands
# -------------------------
# g          = git
# gst        = git status 
# gl         = git pull
# gp         = git push
# gc         = git commit -v
# gca        = git commit -v -a
# gsw        = git swtich
# gswc       = git swtich -c
# gco        = git checkout
# gcm        = git checkout master
# gb         = git branch
# gba        = git branch -a
# gcount     = git shortlog -sn
# gcp        = git cherry-pick
# ga         = git add
# gm         = git merge

# -------------------------
# Reset & Revert Commands
# -------------------------
# grh        = git reset HEAD
# grhh       = git reset HEAD --hard

# -------------------------
# SVN Integration Commands
# -------------------------
# gsr        = git svn rebase
# gsd        = git svn dcommit

# -------------------------
# Advanced Pull & Push Commands
# -------------------------
# ggpull     = git pull origin $(current_branch)
# ggpush     = git push origin $(current_branch)
# ggpnp      = git pull origin $(current_branch) && git push origin $(current_branch)
# gpsup      = git push --set-upstream origin $(git_current_branch)

# -------------------------
# Diff Commands
# -------------------------
# gdv        = git diff -w "$@" | view -

# -------------------------
# SVN Commit Push Command
# -------------------------
# git-svn-dcommit-push = git svn dcommit && git push github master:svntrunk

