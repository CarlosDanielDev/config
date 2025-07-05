set fish_greeting "Welcome mr. Daniel"

set -gx TERM xterm-256color

set fish_theme agnoster
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8

set Z_CMD j

set PATH /usr/local/Homebrew/bin $PATH

set -gx NVM_DIR $HOME/.nvm

set --universal nvm_default_version 20


/opt/homebrew/bin/brew shellenv | source

# ANDROID 
set ANDROID_SDK_ROOT /Users/carlos/Library/Android/sdk $ANDROID_SDK_ROOT

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias lha "ls -lha"
alias g git
alias ide '~/./ide.sh'
alias clock '~/./clock_reminder.sh'
alias ip-address '~/./ip.sh'
alias fbits.storefront '/Users/carlos/puravida/fbits.storefront'

alias pm3 "/Users/carlos/projects/proxmark3/pm3"
alias pm3-flash "/Users/carlos/projects/proxmark3/pm3-flash"
alias pm3-flash-all "/Users/carlos/projects/proxmark3/pm3-flash-all"
alias pm3-flash-bootrom "/Users/carlos/projects/proxmark3/pm3-flash-bootrom"
alias pm3-flash-fullimage "/Users/carlos/projects/proxmark3/pm3-flash-fullimage"

alias nv 'nvm use'

alias vim 'nvim'

command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

if status is-interactive
    set -q nvm_default_version; and nvm use --silent $nvm_default_version
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    source (dirname (status --current-filename))/config-linux.fish
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end


set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# SET PHP
set -x PHPEENV_ROOT $HOME/.phpenv
set -x PATH $PHPEENV_ROOT/bin $PATH
status --is-interactive; and source (phpenv init -|psub)

# flags pra compilar PHP com dependências do brew
set -x CPPFLAGS "-I/opt/homebrew/opt/bzip2/include -I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/zlib/include -I/opt/homebrew/opt/icu4c/include"
set -x LDFLAGS "-L/opt/homebrew/opt/bzip2/lib -L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/zlib/lib -L/opt/homebrew/opt/icu4c/lib"
set -x PKG_CONFIG_PATH "/opt/homebrew/opt/bzip2/lib/pkgconfig:/opt/homebrew/opt/openssl@3/lib/pkgconfig:/opt/homebrew/opt/zlib/lib/pkgconfig:/opt/homebrew/opt/icu4c/lib/pkgconfig"

# GNUGREP
set -x PATH /opt/homebrew/opt/grep/libexec/gnubin $PATH
status is-interactive; and rbenv init - fish | source
source "(brew --prefix asdf)"/libexec/asdf.fish
set -gx PATH /opt/homebrew/opt/asdf/bin /opt/homebrew/opt/asdf/shims $PATH
set -gx PATH $HOME/.rubies/ruby-2.7.5/bin $PATH
