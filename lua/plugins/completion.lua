return {
    "saghen/blink.cmp", -- Completion plugin
    opts = function(_, opts)
        -- Enable completion by default for each buffer
        vim.b.completion = true

        -- Register a toggle (via Snacks) for enabling/disabling completion
        -- The toggle stores its state in vim.b.completion and can be toggled with <leader>uk
        Snacks.toggle({
            name = "Completion",
            get = function()
                return vim.b.completion
            end,
            set = function(state)
                vim.b.completion = state
            end,
        }):map("<leader>uk")

        -- Enable completion for blink.cmp based on the state of vim.b.completion
        opts.enabled = function()
            return vim.b.completion
        end
        return opts
    end,
}
