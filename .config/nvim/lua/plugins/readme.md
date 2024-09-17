1. lsconfig
clangd 需要系统安装clangd, 注意clang版本对glibc兼容，
lsconfig.clangd.setup后需要 compile_command.json

cd /yourproject/
mkdir build && cd build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
make -j 4
cd .. && ln -s build/compile_command.json compile_command.json

2. cmp-nvim-lsp 与 nvim-cmp 配合使用 
