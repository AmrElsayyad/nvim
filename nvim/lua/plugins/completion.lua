-- Initialize global completion variable at startup
if vim.g.completion == nil then
    vim.g.completion = true
end

return {
    "saghen/blink.cmp", -- Completion plugin
    opts = function(_, opts)
        -- Global toggle for enabling/disabling completion across session
        Snacks.toggle({
            name = "Completion",
            get = function()
                return vim.g.completion
            end,
            set = function(state)
                vim.g.completion = state
            end,
        }):map("<leader>uk")

        -- Enable completion based on the state of vim.g.completion
        opts.enabled = function()
            return vim.g.completion
        end
        return opts
    end,
}
