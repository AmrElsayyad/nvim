return {
    "folke/sidekick.nvim",
    opts = {
        -- add any options here
        cli = {
            mux = {
                backend = "tmux",
                enabled = true,
            },
            tools = {
                claude = {
                    cmd = { "ccr", "code" },
                },
            },
            win = {
                layout = "right",
                split = {
                    width = 0.5,
                    height = 0.5,
                },
            },
        },
    },
    keys = {
        {
            "<tab>",
            function()
                -- if there is a next edit, jump to it, otherwise apply it if any
                if not require("sidekick").nes_jump_or_apply() then
                    return "<Tab>" -- fallback to normal tab
                end
            end,
            expr = true,
            desc = "Goto/Apply Next Edit Suggestion",
        },
        {
            "<leader>ka",
            function()
                require("sidekick.cli").toggle()
            end,
            desc = "Sidekick Toggle CLI",
        },
        {
            "<leader>ks",
            function()
                require("sidekick.cli").select()
            end,
            -- Or to select only installed tools:
            -- require("sidekick.cli").select({ filter = { installed = true } })
            desc = "Select CLI",
        },
        {
            "<leader>kd",
            function()
                require("sidekick.cli").close()
            end,
            desc = "Detach a CLI Session",
        },
        {
            "<leader>kt",
            function()
                require("sidekick.cli").send({ msg = "{this}" })
            end,
            mode = { "x", "n" },
            desc = "Send This",
        },
        {
            "<leader>kf",
            function()
                require("sidekick.cli").send({ msg = "{file}" })
            end,
            desc = "Send File",
        },
        {
            "<leader>kv",
            function()
                require("sidekick.cli").send({ msg = "{selection}" })
            end,
            mode = { "x" },
            desc = "Send Visual Selection",
        },
        {
            "<leader>kp",
            function()
                require("sidekick.cli").prompt()
            end,
            mode = { "n", "x" },
            desc = "Sidekick Select Prompt",
        },
        {
            "<leader>kc",
            function()
                require("sidekick.cli").toggle({
                    name = "claude",
                    focus = true,
                })
            end,
            desc = "Sidekick Toggle Claude",
        },
        {
            "<leader>kg",
            function()
                require("sidekick.cli").toggle({
                    name = "gemini",
                    focus = true,
                })
            end,
            desc = "Sidekick Toggle Gemini",
        },
    },
}
