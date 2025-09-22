# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Windows
```
Set-ExecutionPolicy unrestricted
```

```
winget install Microsoft.PowerShell Microsoft.WinowsTerminal NeoVim.NeoVim Git.Git BurntSushi.ripgrep.MSVC JesseDuffield.lazygit OpenJS.NodeJS.LTS 7zip.7zip Microsoft.VisualStudio.2022.BuildTools
```

```
npm install -g tree-sitter-cli
```

```
tree-sitter.ps1 init-config
```

```
git clone https://github.com/sbradl/lazyvim.git $env:LOCALAPPDATA\nvim
```

set proxy in $env:LOCALAPPDATA\nvim\lua\config\options.lua
vim.env.HTTP_PROXY = ... 
vim.env.HTTPS_PROXY = ... 

VS Build Tools -> Modify -> Install C++ Workload
