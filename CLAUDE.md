# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration using the Lazy.nvim plugin manager. The config is organized under the `lua/davidkhanks/` directory structure.

## Architecture

The initialization flow is:
1. `init.lua` (root) → loads `davidkhanks.core` and `davidkhanks.lazy`
2. `davidkhanks.core` → loads `options.lua` and `keymaps.lua`, then configures Expert Elixir LSP
3. `davidkhanks.lazy` → bootstraps Lazy.nvim and imports plugins from `davidkhanks.plugins` and `davidkhanks.plugins.lsp`

### Plugin Organization

Plugins are defined as Lua tables in individual files under `lua/davidkhanks/plugins/`:
- Each file returns a table with the plugin's GitHub repo (e.g., `"folke/lazy.nvim"`)
- Plugins are pinned to specific commits for stability
- Lazy.nvim handles lazy-loading based on `event` triggers (e.g., `BufReadPre`, `BufNewFile`)
- Plugin configs include setup calls and keymaps specific to that plugin

### LSP Setup

Language servers are managed via Mason in two files:
- `plugins/lsp/mason.lua` - Installs LSP servers (ts_ls, ruby_lsp, lua_ls, pyright, etc.) and formatters (prettier, stylua, eslint_d)
- `plugins/lsp/lspconfig.lua` - Configures each LSP with keybinds and capabilities; includes custom handlers for ruby_lsp, svelte, graphql, pyright, emmet_ls, and lua_ls

Note: Expert Elixir Language Server is configured directly in `core/init.lua` using the native `vim.lsp.config()` API (not Mason).

### Keymap Structure

Leader key is `<Space>`. Keymaps are organized by prefix:
- `<leader>w*` - Window management (split, move, resize, close)
- `<leader>b*` - Buffer management (delete, list, etc.)
- `<leader>f*` - File operations (save, find, etc.)
- `<leader>t*` - Tab management
- `<leader>g*` - Git operations (via neogit)
- `<leader>p*` - Project-wide search (via Telescope)
- `<leader>s*` - Search operations (live grep, buffer search, etc.)
- `<leader>m*` - LSP actions (format, rename, code actions, hover)
- `<leader>e*` - Error/diagnostic navigation
- `<leader>k*` - Marks management

LSP keybinds (defined in `lspconfig.lua`) are only active when an LSP attaches to a buffer.

## Testing and Development

There are no automated tests for this Neovim config. Changes are validated by:
1. Opening Neovim: `nvim`
2. Checking for errors during startup
3. Verifying Lazy.nvim status: `:Lazy`
4. Testing affected keymaps and plugin functionality

## Plugin Development

When modifying or adding plugins:
- Add new plugin files to `lua/davidkhanks/plugins/`
- Follow the pattern: return a table with repo, commit hash, dependencies, event triggers, and config function
- Lazy.nvim automatically discovers and loads any new plugin files
- Use `:Lazy sync` to install/update plugins after adding them
- Keymaps should include `desc` field for which-key integration

## Language Server Installation

To add a new language server:
1. Add the server name to `mason_lspconfig.setup({ ensure_installed = {...} })` in `mason.lua`
2. If custom config is needed, add a handler in `mason_lspconfig.setup_handlers()` in `lspconfig.lua`
3. Run `:Mason` to verify installation

## Formatting

Formatting is handled by conform.nvim (`formatting.lua`):
- Auto-formats on save with 3-second timeout
- Uses prettier for JS/TS/CSS/HTML/JSON/YAML/Markdown/GraphQL
- Uses stylua for Lua files
- Manual format: `<leader>mp` in normal or visual mode
