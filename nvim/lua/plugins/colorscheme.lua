return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            -- The theme comes in four flavors: night, storm, day, and moon.
            style = "day",
        },
    },
    {
        "olimorris/onedarkpro.nvim",
        lazy = false,
    },
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        opts = {
            flavour = "latte", -- latte, frappe, macchiato, mocha
        },
    },
    { "EdenEast/nightfox.nvim" },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin",
        },
    },
}
