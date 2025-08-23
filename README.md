# My NeoVim Configuration

This is my personal NeoVim configuration, built on top of the excellent
[LazyVim](https://github.com/LazyVim/LazyVim) framework. It's tailored for web
development (JavaScript, TypeScript, Python), Kubernetes development, and
note-taking with Obsidian.

## Features

This configuration includes a wide range of plugins to enhance the NeoVim
experience. Here are some of the key features:

- **Plugin Management:** Uses [lazy.nvim](https://github.com/folke/lazy.nvim) for fast and easy plugin management.
- **Completion:** Powered by [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) with sources for LSP, snippets, buffer, and path.
- **Code Formatting:** Integrates [conform.nvim](https://github.com/stevearc/conform.nvim) for automatic code formatting on save, with support for various languages.
- **LSP:** Enhanced LSP UI with [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim).
- **UI:** A beautiful and functional UI with [noice.nvim](https://github.com/folke/noice.nvim) and a custom dashboard with [alpha-nvim](https://github.com/goolord/alpha-nvim).
- **Kubernetes:** Manage Kubernetes resources directly from NeoVim with [kubectl.nvim](https://github.com/piersolenski/kubectl.nvim).
- **Note-taking:** Seamless integration with [Obsidian](https://obsidian.md/) using [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim).
- **Code Coverage:** Visualize code coverage reports with [nvim-coverage](httpshttps://github.com/andythigpen/nvim-coverage.lua).
- **Time Tracking:** Track your coding activity with [WakaTime](https://wakatime.com/).
- **AI-powered Completion:** Supercharge your coding with [Supermaven](https://supermaven.com/).

## Getting Started

To use this configuration, you'll need to have NeoVim v0.8.0+ installed. Then,
you can clone this repository to your `~/.config/nvim` directory:

```bash
git clone https://github.com/AmrElsayyad/nvim.git ~/.config/nvim
```

The first time you open NeoVim, `lazy.nvim` will automatically install all the plugins.

## Customization

This configuration is highly customized. Here are some of the key customizations:

- **Keymaps:**
  - `+` and `-` are mapped to increment and decrement numbers.
- **Options:**
  - Undercurl is enabled for better syntax highlighting.
- **Plugins:**
  - All custom plugins are configured in the `lua/plugins` directory.

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
