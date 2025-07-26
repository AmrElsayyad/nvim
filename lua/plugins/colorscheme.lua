return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            -- The theme comes in four flavors: night, storm, day, and moon.
            style = "night",

            on_highlights = function(highlights, colors)
                highlights.WinSeparator = { fg = colors.teal }
                highlights.AvanteSidebarWinSeparator = { fg = colors.teal }
            end,
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
        config = function()
            require("github-theme").setup({
                -- ...
            })

            vim.cmd("colorscheme github_dark_default")
        end,
    },
}
