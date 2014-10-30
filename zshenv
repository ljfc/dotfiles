export EDITOR=vim

path=(/usr/local/sbin $path) # Add /usr/local/sbin as requested by brew.
path=(/usr/local/bin $path) # Prepend /usr/local/bin so it overrides system-installed binaries.

# Support changing Ruby version
source /usr/local/opt/chruby/share/chruby/chruby.sh

# Automatically change Ruby version.
source /usr/local/opt/chruby/share/chruby/auto.sh

