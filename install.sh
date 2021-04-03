#!/bin/bash

FALDOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

so() {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     MACHINE=linux;;
        Darwin*)    MACHINE=mac;;
        *)          MACHINE="UNKNOWN:${unameOut}"
    esac

    echo "$MACHINE"
}

command_exists() {
  type "$1" >/dev/null 2>&1
}


#
# Install packages
# ==============================================================================================================================
#
if [ `so` = "linux" ]; then
    if [ `command_exists` pacman ]; then
        xargs -0 -n 1 sudo pacman -Syu --noconfirm < <(tr \\n \\0 <"$FALDOT/pacman.pkglist")
    elif [ `command_exists` apt ]; then
        xargs sudo apt-get install < "$FALDOT/apt.pkglist"
    fi
    
    if [ `command_exists` snap ]; then
        xargs -0 -n 1 sudo snap install < <(tr \\n \\0 <"$FALDOT/snap.pkglist")
    fi
elif [ `so` = "mac" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    xargs brew install < "$FALDOT/brew.pkglist"
fi


#
# Install shell configuration
# ==============================================================================================================================
#
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
curl -fsSL https://starship.rs/install.sh | bash

ln -sf "$FALDOT/.vim" ~/.vim
ln -sf "$FALDOT/.vimrc" ~/.vimrc
ln -sf "$FALDOT/.viminfo" ~/.viminfo
rm -rf ~/.oh-my-zsh
ln -sf "$FALDOT/.oh-my-zsh" ~/.oh-my-zsh
ln -sf "$FALDOT/.zshrc" ~/.zshrc

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#
# Misc
# ==============================================================================================================================
#
sudo cp "$FALDOT/Fonts/*" /usr/share/fonts/

exit 0