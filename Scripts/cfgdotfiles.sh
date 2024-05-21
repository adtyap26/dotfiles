#!/usr/bin/env bash
git clone --bare git@github.com:adtyap26/dotfiles.git $HOME/.cfg
# define config alias locally since the.cfg
# aren't installed on the system yet
function config {
   git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
# create a directory to backup existing.cfg to
mkdir -p .cfg-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out .cfg from git@github.com:adtyap26.cfg.git";
  else
    echo "Moving existing.cfg to ~/.cfg-backup";
    config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .cfg-backup/{}
fi
# checkout.cfg from repo
config checkout
config config status.showUntrackedFiles no
