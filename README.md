localrun=/LocalRun/usr

cd $localrun

git clone https://github.com/mawnja/dotfiles.git

cd dotfiles && mkdir .local && cd .local

mkdir bin include lib share state

ln -s ${localrun}/dotfiles/.local ~/.local
ln -s ${localRun}/dotfiles/.config ~/.config
ln -s ${localRun}/dotfiles/.bashrc ~/.bashrc
ln -s ${localRun}/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ${localRun}/dotfiles/zsh/.oh-my-zsh ~/.oh-my-zsh

cd ${localrun}/download
wget https://www.python.org/ftp/python/3.8.10/Python-3.8.10.tgz
tar -zxvf Python-3.8.10.tgz && cd Python-3.8.10
mkdir ~/.local/share/python
./configure --prefix ~/.local/share/python
make
make install
python3 -m pip install pynvim

cd ..
wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz
tar -zxvf nvim-linux64.tar.gz
cp -r nvim-linux64 ~/.local/share

wget https://nodejs.org/dist/v16.20.2/node-v16.20.2-linux-x64.tar.xz
tar -xvf node-v16.20.2-linux-x64.tar.xz
cp -r node-v16.20.2-linux-x64 ~/.local/share

wget https://codeload.github.com/rust-lang/cargo/tar.gz/refs/tags/0.82.0
tar -zxvf 0.82.0
cd cargo-0.82.0
cargo build --release
cp -r cargo-0.82.0 ~/.local/share

wget https://codeload.github.com/BurntSushi/ripgrep/tar.gz/refs/tags/14.1.0
tar -zxvf 14.1.0
cd ripgrep-14.1.0
cargo install ripgrep
