# cellox.vim

Simple plugin that provides [Cellox](https://github.com/FrederikTobner/Cellox) language support for vim and neovim.

![Syntax Highlighting](./images/example.png)

## Installation

### Using Git

The plugin should work with Vim/NeoVim's native plugin manager out of the box. You should be able to configure the plugin under unix-like systems like that:

```
cd ~/.vim/pack/plugins/start && git clone https://github.com/FrederikTobner/cellox.vim
```

### Using Plug

You can quickly install the plugin using [plug](https://github.com/junegunn/vim-plug) by adding the following line to your Vim or NeoVim configuration file Vim-Plug plugin section

```
Plug 'FrederikTobner/cellox.vim'
```

and then run `PlugInstall`.

## Usage

Typing the command `:CelloxRun` interprets the current script.

Typing the command `:CelloxStoreChunk` converts the current script to bytecode and stores the intermediate representation as a chunk file.
