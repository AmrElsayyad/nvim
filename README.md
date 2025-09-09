# My NeoVim Configuration

This is my personal NeoVim configuration, built on top of the excellent
[LazyVim](https://github.com/LazyVim/LazyVim) framework. It's tailored for web
development (JavaScript, TypeScript, Python), Kubernetes development, and
note-taking with Obsidian.

## Table of Contents

- [Features](#features)
- [LazyVim Extras](#lazyvim-extras)
- [AI Providers](#ai-providers)
- [Getting Started](#getting-started)
- [Customization](#customization)
- [Performance](#performance)
- [Architecture](#architecture)
- [Contributing](#contributing)

## Features

This configuration includes a wide range of plugins to enhance the NeoVim
experience. Here are some of the key features:

- **Plugin Management:** Uses [lazy.nvim](https://github.com/folke/lazy.nvim)
  for fast and easy plugin management.
- **Completion:** Powered by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  and [blink.cmp](https://github.com/saghen/blink.cmp) with sources for LSP,
  snippets, buffer, and path. Completion is enabled or disabled globally for
  all buffers via a session-wide toggle (\<leader\>uk).
- **Code Formatting:** Integrates
  [conform.nvim](https://github.com/stevearc/conform.nvim) for automatic code
  formatting on save, with support for various languages.
- **LSP:** Enhanced LSP UI with
  [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim), also filtering
  diagnostics for `.env` files for a cleaner development experience.
- **UI:** A beautiful and functional UI with
  [noice.nvim](https://github.com/folke/noice.nvim) and a custom dashboard
  with [alpha-nvim](https://github.com/goolord/alpha-nvim).
- **Kubernetes:** Manage Kubernetes resources directly from NeoVim with [kubectl.nvim](https://github.com/piersolenski/kubectl.nvim).
- **Database Management:** Use
  [nvim-dbee](https://github.com/kndndrj/nvim-dbee) for interactive database
  connections, query execution, and management inside NeoVim.
- **Note-taking:** Seamless integration with [Obsidian](https://obsidian.md/)
  using [obsidian.nvim](https://github.com/obsidian-nvim/obsidian.nvim).
- **Code Coverage:** Visualize code coverage reports with [nvim-coverage](https://github.com/andythigpen/nvim-coverage.lua).
- **Time Tracking:** Track your coding activity with [WakaTime](https://wakatime.com/).
- **AI-powered Completion:** Supercharge your coding with
  [Supermaven](https://supermaven.com/) and [Avante.nvim](https://github.com/yetone/avante.nvim).

## LazyVim Extras

This configuration includes the following LazyVim extras:

- **Coding:** `mini-surround`, `yanky` _(Note: `mini.pairs` is disabled)_
- **DAP:** `core`
- **Editor:** `dial`, `inc-rename`, `mini-files`
- **Formatting:** `prettier`
- **Languages:** `angular`, `clangd`, `docker`, `java`, `json`, `markdown`,
  `python`, `rust`, `sql`, `toml`, `typescript`, `yaml`
- **Linting:** `eslint`
- **Testing:** `core`
- **Utilities:** `dot`, `mini-hipatterns`

## AI Providers

This configuration uses `avante.nvim` for AI-powered code generation and completion.

**Note:** By default, Avante.nvim's auto suggestions are disabled in this
configuration (see `lua/plugins/avante.lua`) in favor of the faster Supermaven
auto suggestions. If you prefer Avante.nvim inline suggestions, set
`auto_suggestions = true` in the Avante.nvim plugin options.

The following AI completion providers are configured:

- `copilot`
- `gemini`
- `huggingface`
- `ollama`
- `openrouter`

## Getting Started

To get started with this configuration:

1. **Ensure you have NeoVim v0.9+ installed** (check with `nvim --version`).
2. **Clone this repository** to your `~/.config/nvim` directory:

   ```bash
   git clone https://github.com/AmrElsayyad/nvim.git ~/.config/nvim
   ```

3. **Open NeoVim**. The first launch will trigger plugin installation via
   `lazy.nvim`. Follow any prompts that appear to complete setup.
4. **Recommended:** Install a Nerd Font for full icon support. Visit [Nerd
   Fonts](https://www.nerdfonts.com/) for instructions.

Optional: For advanced AI features, set up provider credentials as documented
in `avante.nvim` and related plugins.

## Customization

This configuration is highly customizable. Here's how you can customize it:

### Completion Toggle (Global)

Completion can be enabled or disabled globally for your entire session. Use
`<leader>uk` to toggle completion on or off. This sets the global variable
`vim.g.completion`, which controls whether completion features are active in all
buffers.

### Adding New Plugins

To add a new plugin, simply create a new Lua file in the `lua/plugins`
directory with the plugin's specification. For example, to add a plugin called
`my-plugin`, you would create a file called `lua/plugins/my-plugin.lua` with
the following content:

```lua
return {
  "user/my-plugin",
  -- Plugin options here
}
```

### Overriding Existing Plugins

You can override the default configuration of any plugin by creating a file
with the same name in the `lua/plugins` directory. For example, to override
the default configuration for the `nvim-cmp` plugin, you would create a file
called `lua/plugins/cmp.lua` and add your custom configuration there.

### Keymaps

Custom keymaps are defined in the `lua/config/keymaps.lua` file. You can add
your own keymaps to this file.

- **Telescope**:
  - `<leader><space>` (normal mode): Find Files (cwd)
  - `<leader>/` (normal mode): Grep (cwd)
- **Increment/Decrement Number**:
  - `+` (normal mode): Increment number under cursor
  - `-` (normal mode): Decrement number under cursor
- **Debug Adapter Protocol (DAP):**
  - `<down>` (normal mode): Step over
  - `<right>` (normal mode): Step into
  - `<left>` (normal mode): Step out
  - `<up>` (normal mode): Restart debugger
- **nvim-dbee**:
  - `<leader>D` (normal mode): Launch nvim-dbee for database management

### Options

Custom options are defined in the `lua/config/options.lua` file. You can add
your own options to this file.

## Performance

This configuration is designed to be fast and responsive. However, to further
improve startup time, you can lazy-load some of the less frequently used plugins
by setting `lazy = true` in their configuration files.

## Architecture

This configuration follows the modular architecture of LazyVim. Each plugin is
configured in its own file, making it easy to add, remove, or modify plugins
without affecting the rest of the configuration.

## Contributing

This is a personal configuration, but feel free to fork it and customize it to
your own needs. If you have any suggestions or find any issues, please open an
issue on the GitHub repository.
