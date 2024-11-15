# NeoVim Setup with Lazy

Follow these steps to set up NeoVim with this config

## Install NeoVim and dependencies

Install NeoVim and ripgrep

Ripgrep is a cmdline utility that has a fantastic fuzzy finder
and it is used for some of the telescope commands to find strings.

### Mac

`brew install neovim`

`brew install ripgrep`

### Linux (Debian)

`sudo apt install neovim`

`sudo apt install ripgrep`

## Put these files in the correct location on your filesystem

This directory needs to be in the correct place for it be found.

I use ~/.config/ and name this containing folder nvim.

So your completed structure will be:

`~/.config/nvim/`

where nvim is the root dir of these files.

This will cause neovim to run all of the code in here by default on startup.
If you want to use a different name, you have to tell neovim what the dir name
will be in order for it find the correct dir. You can do this with the

`NVIM_APPNAME={your-dir-name}` env var

put that before running nvim or in your .bashrc or .zshrc file.

## Overview of how this config is set up

NeoVim will immediately run the init.lua file at the root of this project.

This in turn will run the `davidkhanks.core` and `davidkhanks.lazy` files.

the `core` will run the `init.lua` file in that folder which will in turn run the
`keymaps.lua` and `options.lua` files.

keymaps will set up a lot of custom keymaps for general vim use and options
will set up various vim settings such as how to track undo changes and reloading
files that change on disk, etc.

### Running Lazy

Lazy starts and runs automatically

`davidkhanks.lazy` will run the Lazy package manager which will install the plugins
that are configured in the plugins directory. You can see in that it will run the
`davidkhanks.plugins` which will look for a lua table in any of the files in that dir.

This will install some oft used dependencies so we don't need to explicitly install them.
The rest of the plugins are configured in their

respective files.

You can see the basic format of a plugin config is to return a table `{}` that contains
the github short link and a config function. Optionally you can give a commit hash to pin
a specific version of the plugin and an event name or names on when the plugin will be loaded.
Lazy can lazyload plugins JIT (hence the name) which means you can have a lot of plugins and not
have a crazy long start time.

## Plugin rundown

Really quick rundown of what each plugin does

- Alpha: Nice start/splash screen when you open nvim
- Autopairs: when you type a char that has a pair it completes them ie `(), {}, ""`
- Colorscheme: Mine is called onedark but there are lots of different ones
- Comment: Sets up `gcc` as the code comment command. Integrated into NeoVim as of version 10 but
  I have some extras in here that I like
- Dressing: Makes some typed commands show up in a pretty box instead of the default status line
- Formatting: sets up linters for various languages and options around when they execute for formatting.
- Gitsigns: Sets up git indicators like VSCode so you can see what changes are new, changed, removed etc
- Harpoon: File pin plugin written by ThePrimeagen. Nice for quickly navigating between heavily used files
- Linting: additional linting config for running specific linters
- LuaLine: Nice status bar theming that is configurable
- Marks: A way to visually track vim marks in a file
- NeoScroll: Smooth scrolling for using <C-u>, <C-d>
- Nvim-cmp: Completion UI that is similar to VSCode
- Nvim-tree: Tree structure buffer that is similar to VSCode's.
- Surround: Pluging for altering surrounding characters on text
- Telescope: A super extensible UI plugin that is most often used for different finders (A la project files, project wide grep, buffer grep, etc)
- Todo-comments: A plugin that allows you to easily see TODOs and other related comments in a file
- Treesitter: Syntax tree plugin that is used for various other plugins
- Vim-maximizer: Allows for easier window maximization when using split windows in NeoVim
- Which-key: A plugin that uses the defined descriptions for key maps to help you know what key does what after pressing <leader>

Additionally, I have LSP related plugins in their own directory. LSP (Language Server Protocol) is what VSCode uses for to parse
and understand the code in a project. It is what allows for things like jumpt to definition, etc.

- Lspconfig: The official NeoVim LSP plugin that allows for various niceties in your editing environment
- mason: an LSP specific package manager. You can install all of them manually or you can have Mason do it for you.

## Most important Plugins

To me a lot of these are just nice-to-haves but the ones that I care about the most are telescope, which let's me do various types of searching,
Nvim-tree, which I like to have to see where I am at in a project (netrw is trash in comparison IMO), and the LSP setup.
