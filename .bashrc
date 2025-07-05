alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gp='git pull --rebase'

alias v="nvim"
alias l='cd /LocalRun/wenjian.ma'
alias tvm='cd /LocalRun/wenjian.ma/tvm'

export localrun=/LocalRun/wenjian.ma

export TMPDIR=/LocalRun/wenjian.ma/.temp

export PATH=/usr/local/cuda/bin:$PATH

export PATH=~/.cargo/bin:$PATH
export PATH=~/.rustup/bin:$PATH
export PATH=~/.local/share/python/bin:$PATH
export PATH=~/.local/share/nvim-linux64_v0.9.5/bin:$PATH
export PATH=~/.local/share/node-v16.18.0-linux-x64/bin:$PATH
export PATH=~/.local/share/ripgrep/target/release:$PATH
export PATH=~/.local/share/fd/target/release:$PATH
export PATH=~/.local/share/yarn/bin:$PATH
export PATH=~/.local/share/clangd_11.0.0/bin:$PATH
#export PATH=~/.local/share/cargo-0.82.0/target/release:$PATH
export PATH=~/.local/share/cmake-language-server/bin:$PATH
export PATH=~/dotfiles/zsh/myzsh/usr/bin:$PATH
export PATH=${localrun}/program_en/cmake-3.25.0-linux-x86_64/bin:$PATH
export PATH=${localrun}/program_en/vscode/VSCode-linux-x64/bin:$PATH
#export PATH=/usr/local/cuda/bin:$PATH
export PATH=${localrun}/program_en/openssl-1.1.1/target/bin:$PATH

#export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=${localrun}/program_en/openssl-1.1.1/target/lib:$LD_LIBRARY_PATH
export PATH=${localrun}/program_en/rbenv/bin:$PATH
#eval "$(rbenv init -)"

export NVIM_PROFILE=1
. "$HOME/.cargo/env"
