#!/bin/sh

copy_files=`find . -maxdepth 1 -name '.*' -exec basename {} \; | egrep -v -e '^\.$' -e '^\.git'`

echo 'Copy Targets =========='
echo "Dir: `ls -d ./`"
echo "${copy_files}" ; echo

for file in ${copy_files}; do
    cp -R "./${file}" "${HOME}/"
done

echo ; echo 'Set Dotfiles =========='
echo "Dir: `ls -d $HOME`\n"
ls -ld ${copy_files}

exit 0
