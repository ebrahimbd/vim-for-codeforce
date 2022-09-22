install () {
  sudo apt install build-essential cmake
  sudo pip install cmake
  sudo sudo cp .vimrc ~/
  echo "[-] Download fonts [-]"
  echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip"
    if [[ -f DroidSansMono.zip ]]
    then
        echo " DroidSansMono.zip exists on your filesystem."
        unzip DroidSansMono.zip -d ~/.fonts
        fc-cache -fv
    else
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
  unzip DroidSansMono.zip -d ~/.fonts
  fc-cache -fv
    fi
}


if ! [ -x "$(command -v vim)" ]; then
  sudo apt-get update
  sudo apt-get install vim-gtk3
  sudo apt-get install vim
  install
  exit 1
else
    install
    echo "=======>> please wait and press enter while install codeforce vim <<< ======"
    vim
fi

