#Common used commands
# Pacman alias examples
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacdl='pacman -Sw'		# Download specified package(s) as .tar.xz ball
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias paclorem="sudo pacman -Rns $(pacman -Qtdq)" #Remove all orphaned packages
alias pacc="sudo pacman -Scc"		# Clean cache - delete all the package files in the cache
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacown="pacman -Qo"		# Show package(s) owning the specified file(s)
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy && sudo abs'         # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps'            # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'                    # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

# dealing with the following message from pacman:
# 
#     error: couldnt lock database: file exists
#     if you are sure a package manager is not already running, you can remove /var/lib/pacman/db.lck

alias pacunlock="sudo rm /var/lib/pacman/db.lck"   # Delete the lock file /var/lib/pacman/db.lck
alias paclock="sudo touch /var/lib/pacman/db.lck"  # Create the lock file /var/lib/pacman/db.lck

# some utility aliases
alias ll='ls -lh --color'
alias ls='ls -Ah --color'
alias la='ls -Ah --color'
alias l='ls -CF --color'
alias grep='rg'
alias vim='nvim'
alias vi='nvim'
alias nv='nvim'
alias snv='sudo nvim'
alias cat='bat'

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'

#VPS
alias singpod='ssh root@128.199.228.218'
alias singpilates='ssh root@128.199.92.48'

# navigation
alias cdhcp='cd $HOME/code/perl/'
alias cdhc='cd $HOME/code/'
alias cdhcon='cd $HOME/.config/'
alias cdhb='cd $HOME/.bin/'
alias cdhpe='cd $HOME/pilates/synapseeducation/'

