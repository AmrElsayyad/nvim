return {
    {
        "folke/noice.nvim",
        opts = function(_, opts)
            table.insert(opts.routes, {
                filter = {
                    event = "notify",
                    find = "No information available",
                },
                opts = { skip = true },
            })

            table.insert(opts.routes, {
                filter = {
                    event = "notify",
                    find = "no manual entry for",
                },
                opts = { skip = true },
            })

            opts.presets.lsp_doc_border = true
        end,
    },
    {
        "folke/snacks.nvim",
        opts = {
            notifier = {
                timeout = 5000,
            },
        },
    },
}
