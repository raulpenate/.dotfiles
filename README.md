# .dotfiles
![diagram ](https://raw.githubusercontent.com/raulpenate/.dotfiles/main/.config/info/Dotfiles%20lifecycle.jpg)

## Instalation: 
```sh
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/raulpenate/.dotfiles.git tmpdotfiles \
&& cd tmpdotfiles && /.install.sh
```

## Usage from scratch:  
This is what you do in case you didn't git clone it.
```bash
# Step 1: Create repo
git init --bare $HOME/.dotfiles

# Step 2: Set alias (Using \ for readbility )
echo "config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> .zshrc && source .zshrc

# Step 3: Hide Tracked files
config config status.showUntrackedFiles no

# Step 4: Save your files
config status
config add .vimrc
config commit -m "Add vimrc"
config push #if you've a repo

# Step 5: Create GitHub repo if you don't have it
gh repo create ".dotfiles" --public   
config push # now that you've a repo
```
