return {
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
}
