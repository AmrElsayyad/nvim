return {
    "folke/sidekick.nvim",
    event = "BufRead",
    opts = {},
    keys = {
        {
            "<tab>",
            function()
                if not require("sidekick").nes_jump_or_apply() then
                    return "<Tab>" -- fallback to normal tab
                end
            end,
            expr = true,
            desc = "Goto/Apply Next Edit Suggestion",
        },
    },
    config = {
        jump = {
            jumplist = true, -- add an entry to the jumplist
        },
        signs = {
            enabled = true, -- enable signs by default
            icon = " ",
        },
        nes = {
            enabled = function(buf)
                return vim.g.sidekick_nes ~= false
                    and vim.b.sidekick_nes ~= false
            end,
            debounce = 100,
            trigger = {
                -- events that trigger sidekick next edit suggestions
                events = {
                    "InsertLeave",
                    "TextChanged",
                    "User SidekickNesDone",
                },
            },
            clear = {
                -- events that clear the current next edit suggestion
                events = { "TextChangedI", "BufWritePre", "InsertEnter" },
                esc = true, -- clear next edit suggestions when pressing <Esc>
            },
            diff = {
                inline = "words",
            },
        },
    },
}
