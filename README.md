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

## Features

This configuration includes a wide range of plugins to enhance the NeoVim
experience. Here are some of the key features:

- **Plugin Management:** Uses [lazy.nvim](https://github.com/folke/lazy.nvim)
  for fast and easy plugin management.
- **Completion:** Powered by [blink.cmp](https://github.com/saghen/blink.cmp)
  with sources for LSP, snippets, buffer, and path. Completion can be toggled
  globally for all buffers via a session-wide toggle (`<leader>uk`).
- **Code Formatting:** Integrates
  [conform.nvim](https://github.com/stevearc/conform.nvim) for automatic code
  formatting on save, with support for various languages including ZSH with beautysh.
- **LSP:** Enhanced LSP UI with
  [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim), filtering
  diagnostics for `.env` files for a cleaner development experience.
- **UI & Dashboard:** Beautiful and functional UI with
  [noice.nvim](https://github.com/folke/noice.nvim) and a custom ASCII dashboard
  powered by [snacks.nvim](https://github.com/folke/snacks.nvim).
- **Kubernetes:** Manage Kubernetes resources directly from NeoVim with
  [kubectl.nvim](https://github.com/Ramilito/kubectl.nvim).
- **Database Management:** Use
  [nvim-dbee](https://github.com/kndndrj/nvim-dbee) for interactive database
  connections, query execution, and management inside NeoVim.
- **Note-taking:** Seamless integration with [Obsidian](https://obsidian.md/)
  using [obsidian.nvim](https://github.com/obsidian-nvim/obsidian.nvim) with custom
  daily notes structure and templates.
- **Code Coverage:** Visualize code coverage reports with [nvim-coverage](https://github.com/andythigpen/nvim-coverage.lua).
- **Time Tracking:** Track your coding activity with [WakaTime](https://wakatime.com/).
- **AI-powered Completion:** Supercharge your coding with
  [Supermaven](https://supermaven.com/) and [Avante.nvim](https://github.com/yetone/avante.nvim)
  with MCP hub integration.
- **Sidekick.nvim:** Advanced AI-powered sidekick for chat, code review, and
  workflow automation inside NeoVim, deeply integrated with Model Context
  Protocol (MCP) for seamless AI-driven assistance
  ([sidekick.nvim](https://github.com/ravitemer/sidekick.nvim)).
- **MCP Integration:** Model Context Protocol support via
  [mcphub.nvim](https://github.com/ravitemer/mcphub.nvim) for enhanced AI capabilities.
- **Window Management:** Smart window resizing with
  [win-resizer.nvim](https://github.com/Kaiser-Yang/win-resizer.nvim).
- **Whitespace Management:** Better whitespace handling with
  [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace).

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

### Advanced: Custom Avante Rules and AI Integration

You can customize Avante.nvim's behavior by editing the avanterules (system
prompts and context rules) found in your configuration. See
`lua/plugins/avante.lua` for the rules and instructions. Updating these
enables personalized code suggestions, improved chat, and custom AI workflows.
For best results, tailor rules to your workflow and preferred AI provider.

The following AI completion providers are configured:

- `copilot`
- `gemini`
- `huggingface`
- `ollama`
- `openrouter`

## Getting Started

To get started with this configuration:

1. **Ensure you have NeoVim v0.11.2+ installed** (check with `nvim --version`).
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

### MCP/mcphub Setup

This configuration leverages the Model Context Protocol (MCP) via
[mcphub.nvim](https://github.com/ravitemer/mcphub.nvim) to enable advanced AI
features and plugin interoperability.

**To enable MCP:**

1. Ensure you have Python 3.8+ and the `pip` package manager installed.
2. Open NeoVim and run `:MCPHub` to start the MCP server from within NeoVim,
   or refer to the mcphub.nvim documentation for setup.
3. Set up any required environment variables or API keys as instructed by
   individual MCP-compatible plugins (such as Avante.nvim or Sidekick.nvim).
4. Check the plugin's status with `:MCPStatus` in NeoVim.

MCP enables seamless integration with AI (code completion, chat, context-aware
actions) and enhances features such as Avante.nvim and Sidekick.nvim.

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

## Troubleshooting & FAQ

### MCP Server Fails to Start

- Ensure you have Python 3.8+ and `pip` installed on your system.
- Try running `:MCPHub` in NeoVim to start the server manually.
- Check for errors in the NeoVim command line and address missing dependencies
  as reported.

### Plugin Installation Issues

- Ensure you are running the latest NeoVim version (`nvim --version`).
- Delete the `.local/share/nvim` plugin directory and restart NeoVim to
  trigger a clean install.
- Check your internet connection.

### Completion or AI Features Not Working

- Make sure completion is enabled globally (`<leader>uk`).
- Verify that required API keys or environment variables are set for your
  chosen AI provider (see plugin docs for details).
- Run `:MCPStatus` to check that MCP is running and all required plugins are loaded.

### Customization Changes Not Taking Effect

- Restart NeoVim after making changes to plugin or config files.
- Run `:Lazy reload` to force a reload of the configuration.

### General Debugging

- Use `:messages` to view recent errors or warnings.
- For more details, run NeoVim with increased verbosity: `nvim -V3logfile`.

If your issue persists, check plugin documentation or open an issue in the
GitHub repository.
