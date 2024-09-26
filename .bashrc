alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gp='git pull --rebase'

alias v="nvim"
alias l='cd /LocalRun/wenjian.ma'
alias tvm='cd /LocalRun/wenjian.ma/tvm'

export localrun=/LocalRun/wenjian.ma

export PATH=~/.local/bin:$PATH
export PATH=~/.local/share/nvim-linux64_v0.9.5/bin:$PATH
export PATH=~/.local/share/node-v16.18.0-linux-x64/bin:$PATH
export PATH=~/.local/share/ripgrep/target/release:$PATH
export PATH=~/.local/share/fd/target/release:$PATH
export PATH=~/.local/share/yarn/bin:$PATH
export PATH=~/.local/share/clangd_11.0.0/bin:$PATH
export PATH=${localrun}/program_en/cmake-3.25.0-linux-x86_64/bin:$PATH
export PATH=${localrun}/program_en/vscode/VSCode-linux-x64/bin:$PATH
export PATH=${localrun}/dotfiles/zsh/myzsh/usr/bin:$PATH
#export PATH=/usr/local/cuda/bin:$PATH

#export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
export PATH=${localrun}/program_en/rbenv/bin:$PATH
eval "$(rbenv init -)"
