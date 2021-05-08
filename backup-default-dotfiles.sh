#!/bin/sh

DOTFILES="
.bash_logout
.bash_profile
.bashrc
.config
.inputrc
.screenrc
.sqliterc
.vim
.vimrc
"

BACKUP_DIRECTORY="${HOME}/.default-dotfiles"

mkdir -p "$BACKUP_DIRECTORY"

for dotfile in ${DOTFILES}; do
    if [ -e "${HOME}/${dotfile}" ]; then
        cp -R "${HOME}/${dotfile}" "$BACKUP_DIRECTORY"
    fi
done

echo 'Backup Folder =========='
ls -ld "$BACKUP_DIRECTORY"

echo ; echo 'Copied Dotfiles =========='
ls -al "$BACKUP_DIRECTORY"

exit 0
