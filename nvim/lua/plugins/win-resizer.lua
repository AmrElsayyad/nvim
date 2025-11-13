return {
    "Kaiser-Yang/win-resizer.nvim",
    lazy = false,
    config = function()
        require("win.resizer").setup({
            ignore_filetypes = {
                -- put the files you don't want them be influenced by win-resizer here
            },
        })
    end,
}
