# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###
# Define variables for paths
export NPM_PACKAGES=$HOME/.npm-packages
export GOPATH=$HOME/Documents/Adit/Learning/COding/Golang/
export GOBIN=$GOPATH/go/bin
export ANDROID_HOME='/opt/android-sdk'
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/tools/bin/
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools/

## Confluent 
export CONFLUENT_HOME=/home/permaditya/Apps/confluent-platform/confluent/
export JAVA_HOME=/home/permaditya/.sdkman/candidates/java/17.0.9-oracle/

#Set the PATH variable with organized paths
# export PATH=$HOME/.bin:~/.local/bin:/usr/local/bin:~/Scripts/:~/Scripts/musikcube_linux_x86_64_0.99.5/:/usr/bin:/bin:/usr/local/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:$HOME/.cargo/bin:/usr/local/texlive/2022/bin/x86_64-linux:$NPM_PACKAGES/bin:$GOBIN:$HOME/.docker
export PATH=\
$CONFLUENT_HOME/bin:\
$JAVA_HOME/bin:\
$HOME/.bin:\
$ANDROID_HOME/cmdline-tools/latest/bin:/\
~/.local/bin:\
/usr/local/bin:\
~/Scripts/:\
~/Scripts/musikcube_linux_x86_64_0.99.5/:\
/usr/bin:\
/bin:\
/usr/local/sbin:\
/usr/bin/site_perl:\
/usr/bin/vendor_perl:\
/usr/bin/core_perl:\
/var/lib/snapd/snap/bin:\
$HOME/.cargo/bin:\
/usr/local/texlive/2022/bin/x86_64-linux:\
$NPM_PACKAGES/bin:\
$GOBIN:\
$HOME/.docker

# Other environment variables
export _JAVA_AWT_WM_NONREPARENTING=1
export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH
export ZELLIJ_CONFIG_DIR=/home/permaditya/.config/zellij


# # Add Go bin directory to the PATH
# export PATH=$PATH:$GOBIN
# # Path to your oh-my-zsh installation.
#installation via script from github
#export ZSH="/home/$USER/.oh-my-zsh"
#installation via paru -S oh-my-zsh-git
export ZSH=/usr/share/oh-my-zsh/
# eval "$(starship init zsh)"
# export STARSHIP_CACHE=~/.starship/cache
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# if you installed the package oh-my-zsh-powerline-theme-git then you type here "powerline" as zsh theme
# ZSH_THEME="mytheme"
# ZSH_THEME="powerlevel10k.zsh-theme"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.

# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# ZSH_THEME_RANDOM_IGNORED=(pygmalion tjkirch_mod)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting
  colorize
  copyfile
  docker
  fzf

)

if [ -f $ZSH/oh-my-zsh.sh ]; then
  source $ZSH/oh-my-zsh.sh
fi

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

####   ARCOLINUX SETTINGS   ####
# export PAGER='most'
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -plman'" 
### "nvim" as manpager
#export MANPAGER="nvim -c 'set ft=man' -"


if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

setopt GLOB_DOTS
#share commands between terminal instances or not
unsetopt SHARE_HISTORY
#setopt SHARE_HISTORY

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

# Make neovim the default editor

export EDITOR='nvim'
export VISUAL='nvim'

#PS1='[\u@\h \W]\$ '

if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi


#vim mode 
# set -o vi
bindkey -v

### ALIASES ###
# # Changing "ls" to "exa"
 alias ls='exa -l --color=always --group-directories-first --icons' # my preferred listing
 alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
 alias ll='exa -al --color=always --group-directories-first --icons'  # long format
 alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing

# Himalaya email client
alias m='himalaya'
alias mwr='himalaya write'
alias mr='himalaya read'
alias mrep='himalaya reply'
alias msy='himalaya account sync'

#git config for managing dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# vimdiff

alias vimdiff="nvim -d"

#neofetch
alias neofetch="neofetch --ascii /home/permaditya/.config/neofetch/ascii-dwm"

# stig --transmission-cli
alias torrent='stig'

# Look keybinding
alias key='~/Scripts/dmenu_sxhkd.sh'

#look for tldr
alias sm='~/Scripts/dmenu_man.sh'


#zathura
alias za='zathura'

# Changing cat to bat

#alias cat='bat' 

# GO to main project
alias js='cd /home/permaditya/Documents/Adit/Learning/COding/Javascript/'
alias golang='cd /home/permaditya/Documents/Adit/Learning/COding/Golang/'
alias flutt='cd /home/permaditya/Documents/Adit/Learning/COding/flutter/'
alias nod='cd /home/permaditya/Documents/Adit/Learning/COding/Javascript/nodejs/'
alias devop='cd /home/permaditya/Documents/Adit/Learning/DevOps/'
alias remang='cd /home/permaditya/Downloads/manga'
alias compro='cd /home/permaditya/Public/company-profile/rwi/hugo/'
alias compros='cd /home/permaditya/Public/company-profile/sci/sintaksis.agency/'
alias web='cd /home/permaditya/Public/personal-web/personal/'
alias psp='cd /home/permaditya/Documents/Adit/Project/PSP/'

#Go to usb
alias usb="cd /run/media/permaditya/"

# useful aliases for mv, cp, mkdir and rm
alias mv='mv -iv'
alias cp='cp -riv'
alias mkdir='mkdir -vp'
alias rm='rm -I'

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'
alias updte='sudo pacman -Syyu'
alias updqte='sudo pacman -Syyu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

## ssh part 
## ssh for unknow terminal
alias ssh='TERM=xterm-256color ssh'
alias ssha='eval $(ssh-agent) && ssh-add'


#readable output
alias df='df -h'

#keyboard
alias give-me-azerty-be="sudo localectl set-x11-keymap be"
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

#arcolinux logout unlock
alias rmlogoutlock="sudo rm /tmp/arcologout.lock"

#which graphical card is working
alias whichvga="/usr/local/bin/arcolinux-which-vga"

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# paru as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="paru -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
#skel alias has been replaced with a script at /usr/local/bin/skel

#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#switch between lightdm and sddm
alias tolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias tosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias toly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias togdm="sudo pacman -S gdm --noconfirm --needed ; sudo systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias tolxdm="sudo pacman -S lxdm --noconfirm --needed ; sudo systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"

# kill commands
# quickly kill conkies
alias kc='killall conky'
# quickly kill polybar
alias kp='killall polybar'
# quickly kill picom
alias kpi='killall picom'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias paruskip='paru -S --mflags --skipinteg'
alias yayskip='yay -S --mflags --skipinteg'
alias trizenskip='trizen -S --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist'
alias rams='rate-mirrors --allow-root --disable-comments --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist'

#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo /usr/local/bin/arcolinux-vbox-share"

#enabling vmware services
alias start-vmware="sudo systemctl enable --now vmtoolsd.service"
alias vmware-start="sudo systemctl enable --now vmtoolsd.service"
alias sv="sudo systemctl enable --now vmtoolsd.service"

#enabling docker
alias sailing="sudo systemctl enable --now docker.service"
alias docking="sudo systemctl disable --now docker.service docker.socket"

#shopt
#shopt -s autocd # change to named directory
#shopt -s cdspell # autocorrects cd misspellings
#shopt -s cmdhist # save multi-line commands in history as single line
#shopt -s dotglob
#shopt -s histappend # do not overwrite history
#shopt -s expand_aliases # expand aliases

#ytfzf
alias yt="ytfzf -t"

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac "
alias yta-best="yt-dlp --extract-audio --audio-format best "
alias yta-flac="yt-dlp --extract-audio --audio-format flac "
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
alias ytv-best="yt-dlp -f 'bv*[height=720]+ba[ext=m4a]' --merge-output-format mp4 "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#iso and version used to install ArcoLinux
alias iso="cat /etc/dev-rel | awk -F '=' '/ISO/ {print $2}'"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlxdm="sudo $EDITOR /etc/lxdm/lxdm.conf"
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist="sudo $EDITOR /etc/pacman.d/arcolinux-mirrorlist"
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="sudo $EDITOR /etc/hosts"
alias nhostname="sudo $EDITOR /etc/hostname"
alias ebas="$EDITOR ~/.bashrc"
alias ezs="$EDITOR ~/.zshrc"
alias efs="$EDITOR ~/.config/fish/config.fish"

#reading logs with bat
alias lcalamares="bat /var/log/Calamares.log"
alias lpacman="bat /var/log/pacman.log"
alias lxorg="bat /var/log/Xorg.0.log"
alias lxorgo="bat /var/log/Xorg.0.log.old"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
alias fix-permissions="sudo chown -R $USER:$USER ~/.config ~/.local"
alias keyfix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias key-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias keys-fix="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkey="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fixkeys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-key="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-keys="/usr/local/bin/arcolinux-fix-pacman-databases-and-keys"
alias fix-sddm-config="/usr/local/bin/arcolinux-fix-sddm-config"
alias fix-pacman-conf="/usr/local/bin/arcolinux-fix-pacman-conf"
alias fix-pacman-keyserver="/usr/local/bin/arcolinux-fix-pacman-gpg-conf"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"
alias downgrada="sudo downgrade --ala-url https://ant.seedhost.eu/arcolinux/"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#update betterlockscreen images
alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"


#-------- Transmission CLI {{{
#------------------------------------------------------
# lightweight torrent daemon, has option for cli, webui, ncurses, and gui frontend 
# WebUI:	http://localhost:9091/transmission/web/
# 		http://192.168.1.xxx:9091/transmission/web/
tsm-clearcompleted() {
        transmission-remote -l | grep 100% | grep Done | \
        awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r ;}
tsm() { transmission-remote --list ;}
	# numbers of ip being blocked by the blocklist
	# credit: smw from irc #transmission
tsm-count() { echo "Blocklist rules:" $(curl -s --data \
	'{"method": "session-get"}' localhost:9091/transmission/rpc -H \
	"$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
	| cut -d: -f 11 | cut -d, -f1) ;}
# demo video: http://www.youtube.com/watch?v=TyDX50_dC0M
tsm-blocklist() { $PATH_SCRIPTS/blocklist.sh ;}		# update blocklist
tsm-daemon() { transmission-daemon ;}
tsm-quit() { killall transmission-daemon ;}
tsm-altspeedenable() { transmission-remote --alt-speed ;}	# limit bandwidth
tsm-altspeeddisable() {	transmission-remote --no-alt-speed ;}	# dont limit bandwidth
tsm-add() { transmission-remote --add "$1" ;}
tsm-askmorepeers() { transmission-remote -t"$1" --reannounce ;}
tsm-pause() { transmission-remote -t"$1" --stop ;}		# <id> or all
tsm-start() { transmission-remote -t"$1" --start ;}		# <id> or all
tsm-purge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
tsm-remove() { transmission-remote -t"$1" --remove ;}		# leaves data alone
tsm-info() { transmission-remote -t"$1" --info ;}
tsm-speed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}

# https://github.com/fagga/transmission-remote-cli
# demo video: http://www.youtube.com/watch?v=hLz7ditUwY8
tsm-ncurse() { transmission-remote-cli ;}

#}}}

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#btrfs aliases
alias btrfsfs="sudo btrfs filesystem df /"
alias btrfsli="sudo btrfs su li / -t"

#snapper aliases
alias snapcroot="sudo snapper -c root create-config /"
alias snapchome="sudo snapper -c home create-config /home"
alias snapli="sudo snapper list"
alias snapcr="sudo snapper -c root create"
alias snapch="sudo snapper -c home create"

#Leftwm aliases
alias lti="leftwm-theme install"
alias ltu="leftwm-theme uninstall"
alias lta="leftwm-theme apply"
alias ltupd="leftwm-theme update"
alias ltupg="leftwm-theme upgrade"

#arcolinux applications
alias att="archlinux-tweak-tool"
alias adt="arcolinux-desktop-trasher"
alias abl="arcolinux-betterlockscreen"
alias agm="arcolinux-get-mirrors"
alias amr="arcolinux-mirrorlist-rank-info"
alias aom="arcolinux-osbeck-as-mirror"
alias ars="arcolinux-reflector-simple"
alias atm="arcolinux-tellme"
alias avs="arcolinux-vbox-share"
alias awa="arcolinux-welcome-app"

#remove
alias rmgitcache="rm -r ~/.cache/git"

#moving your personal files and folders from /personal to ~
alias personal='cp -Rf /personal/* ~'

#apps
alias standard="standard-notes-3.23.170-linux-x86_64.AppImage"
alias lzd='lazydocker'
alias lzg='lazygit'
alias record='screen-recorder.sh'

#create a file called .zshrc-personal and put all your personal aliases
#in there. They will not be overwritten by skel.

[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal


# personal function for search
sc() { du -a ~/Scripts/* ~/.config/* | awk '{print $2}' | fzf --prompt="Select the file: " --height=30 --border --border-label="╢ Edit-File ╟" --color=label:italic:white --color bg:#073642,preview-bg:#073642  --preview 'cat {}'\
  | xargs -r $EDITOR ;}

nt() { du -a ~/Database/note/* | awk '{print $2}' | fzf --prompt="Select the file: " --height=30 --border --border-label="╢ Note-Viewer ╟" --color=label:italic:white --color bg:#073642,preview-bg:#073642  --preview 'cat {}'\
  | xargs -r $EDITOR ;}

wk() { du -a ~/Database/working_note/* | awk '{print $2}' | fzf --prompt="Select the file: " --height=30 --border --border-label="╢ Note-Viewer ╟" --color=label:italic:white --color bg:#073642,preview-bg:#073642  --preview 'cat {}'\
  | xargs -r $EDITOR ;}

learnc() {
    local selected_dir
    selected_dir=$(find ~/Documents/Adit/Learning/COding/C -type d | fzf \
        --prompt="Select the directory: " \
        --height=30 \
        --border \
        --border-label="╢ C-Learning ╟" \
        --color=label:italic:white \
        --color=bg:#073642,preview-bg:#073642 \
        --preview 'ls -la {}')
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir" || { echo "Failed to cd into $selected_dir"; return 1; }
        echo "Changed directory to $selected_dir"
    else
        echo "No directory selected. Staying put."
    fi
}

# yazi
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
### DUNTS

run_dunst() {
        if make -j dunst; then
                pkill dunst
        else
                return 1
        fi
        ./dunst $@
}

### RANDOM COLOR SCRIPT AND WEATHER ###

# colorscript -e elfman
# pokemon-colorscripts --no-title -r
# ~/Scripts/clock
# LANG=en_US date +"%a, %B %d"
 # ~/Scripts/forecast.sh
#curl -s "wttr.in/$1?M1q" | head -7

# reporting tools - install when not installed
#neofetch
#screenfetch
#alsi
#paleofetch
#fetch
#hfetch
#sfetch
#ufetch
#ufetch-arco
#pfetch
#sysinfo
#sysinfo-retro
#cpufetch
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
