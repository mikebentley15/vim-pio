# Vim PIO Syntax Highlighting

Vim syntax for the Raspberry Pi Pico Programmable I/O (PIO) Assembly language.

Notable links:

- [Product description](https://www.raspberrypi.org/products/raspberry-pi-pico/)
- [Documentation](https://www.raspberrypi.org/documentation/microcontrollers/raspberry-pi-pico.html)
- [C/C++ SDK pdf](https://datasheets.raspberrypi.org/pico/raspberry-pi-pico-c-sdk.pdf)
- [C/C++ SDK GitHub](https://github.com/raspberrypi/pico-sdk)
- [C/C++ SDK examples](https://github.com/raspberrypi/pico-examples)
- [Unofficial PIO Emulator](https://github.com/soundpaint/rp2040pio)

## Installation

### Vim packages (recommended; Vim 8+ only)

Clone or submodule this repo into your Vim packages location.  For example:

```bash
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/mikebentley15/vim-pio ~/.vim/pack/plugins/start/
```

### Vundle

Set up [Vundle](https://github.com/VundleVim/Vundle.vim) then add `Plugin 'mikebentley15/vim-pio'` to your vimrc and run `:PluginInstall` from a fresh vim.

### Pathogen

Set up [Pathogen](https://github.com/tpope/vim-pathogen) then clone/submodule this repo into `~/.vim/bundle/toml`, or wherever you've pointed your Pathogen.

### vim-plug

Set up [vim-plug](https://github.com/junegunn/vim-plug).  In your vimrc, between the lines for `call plug#begin()` and `call plug#end()`, add the line `Plug 'mikebentley15/vim-pio'`.  Reload your .vimrc and then run `:PlugInstall`.

### Janus

Set up [Janus](https://github.com/carlhuda/janus) and then clone/submodule this repo into `~/.janus` and restart vim.

## Contributing

Contributions are very welcome!  Please open an issue or a pull request.
