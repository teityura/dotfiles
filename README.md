# dotfiles

`.bashrc` や `.vimrc` や `.vim/` などを GitHubで管理している

## コピペ用

```
mkdir -p ~/git
cd ~/git/
git clone https://github.com/teityura/dotfiles.git
cd dotfiles/
./backup-default-dotfiles.sh
./copy-dotfiles.sh
exec $SHELL

```

## backup-default-dotfiles.sh

デフォルトのdotfilesを `.default-dotfiles` にバックアップする  
バックアップを残しておきたいなら、実行しておく

```
./backup-default-dotfiles.sh

Backup Folder ==========
drwxr-xr-x  11 teityura  staff  352  5  8 20:04 /Users/teityura/.default-dotfiles

Copied Dotfiles ==========
total 56
drwxr-xr-x  11 teityura  staff   352  5  8 20:04 .
drwxr-xr-x@ 40 teityura  staff  1280  5  8 22:41 ..
-rw-r--r--@  1 teityura  staff     6  5  8 22:41 .bash_logout
-rw-r--r--@  1 teityura  staff    62  5  8 22:41 .bash_profile
-rw-r--r--@  1 teityura  staff  2392  5  8 22:41 .bashrc
drwxr-xr-x@  3 teityura  staff    96  5  8 20:04 .config
-rw-r--r--@  1 teityura  staff   284  5  8 22:41 .inputrc
-rw-r--r--@  1 teityura  staff   782  5  8 22:41 .screenrc
-rw-r--r--@  1 teityura  staff    60  5  8 22:41 .sqliterc
drwxr-xr-x@  4 teityura  staff   128  5  8 20:04 .vim
-rw-r--r--@  1 teityura  staff  2328  5  8 22:41 .vimrc
```

## copy-dotfiles.sh

リポジトリで管理しているdotfilesを `${HOME}/` に配置(上書き)する

```
./copy-dotfiles.sh

Copy Targets ==========
Dir: ./
.config .vim .bashrc .bash_logout .gitignore .vimrc .screenrc .sqliterc .inputrc


Set Dotfiles ==========
Dir: /Users/teityura

-rw-r--r--@ 1 teityura  staff     6  5  8 16:23 .bash_logout
-rw-r--r--@ 1 teityura  staff  2392  5  8 21:26 .bashrc
drwxr-xr-x@ 3 teityura  staff    96  5  8 13:39 .config
-rw-r--r--@ 1 teityura  staff    16  5  8 20:20 .gitignore
-rw-r--r--@ 1 teityura  staff   284  5  8 13:39 .inputrc
-rw-r--r--@ 1 teityura  staff   782  5  8 13:39 .screenrc
-rw-r--r--@ 1 teityura  staff    60  5  8 13:39 .sqliterc
drwxr-xr-x@ 3 teityura  staff    96  5  8 20:22 .vim
-rw-r--r--@ 1 teityura  staff  2328  5  8 20:18 .vimrc
```

