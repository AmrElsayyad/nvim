-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

-- Move buffer line left/right
keymap.set("n", "<A-h>", "<cmd>BufferLineMovePrev<CR>")
keymap.set("n", "<A-l>", "<cmd>BufferLineMoveNext<CR>")

-- Telescope
keymap.set(
    "n",
    "<leader><space>",
    LazyVim.pick("files", { root = false }),
    { desc = "Find Files (cwd)" }
)
keymap.set(
    "n",
    "<leader>/",
    LazyVim.pick("live_grep", { root = false }),
    { desc = "Grep (cwd)" }
)

-- Increment/decrement number
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- DAP
keymap.set("n", "<down>", "<cmd>lua require('dap').step_over()<CR>")
keymap.set("n", "<right>", "<cmd>lua require('dap').step_into()<CR>")
keymap.set("n", "<left>", "<cmd>lua require('dap').step_out()<CR>")
keymap.set("n", "<up>", "<cmd>lua require('dap').restart()<CR>")

-- nvim-dbee keymap
local wk = require("which-key")
wk.add({
    { "<leader>D", ":Dbee<CR>", desc = "Launch nvim-dbee", icon = "󰆼" },
})

-- Better window resizing
local resize = require("win.resizer").resize
local map_set = vim.keymap.set

-- You may want change left border first, then set this to 'left'
local first_left_or_right = "right"
-- You may want change bottom border first, then set this to 'bottom'
local first_top_or_bottom = "top"
-- You need not change the following code
local second_left_or_right = first_left_or_right == "right" and "left"
    or "right"
local second_top_or_bottom = first_top_or_bottom == "bottom" and "top"
    or "bottom"

-- How many lines or columns to resize, make sure it is a positive integer
local abs_delta = 3

-- Choose your favorite key mappings
-- Keys in border_to_key will try first_left_or_right or first_top_or_bottom first
local border_to_key = {
    top = "<up>",
    bottom = "<down>",
    left = "<left>",
    right = "<right>",
}
-- Keys in border_to_reverse_key will try second_left_or_right or second_top_or_bottom first
local border_to_reverse_key = {
    top = "<s-up>",
    bottom = "<s-down>",
    left = "<s-left>",
    right = "<s-right>",
}

-- Smart resize, usually you don't need to change this
for _, border in pairs({ "top", "bottom", "left", "right" }) do
    local delta = (
        border == first_left_or_right or border == first_top_or_bottom
    )
            and abs_delta
        or -abs_delta
    local first = (
        border == first_left_or_right or border == second_left_or_right
    )
            and first_left_or_right
        or first_top_or_bottom
    local second = first == first_left_or_right and second_left_or_right
        or second_top_or_bottom
    local desc = "Smart resize " .. first .. " " .. border
    local desc_reverse = "Smart resize " .. second .. " " .. border
    map_set({ "n" }, border_to_key[border], function()
        local _ = resize(0, first, delta, true)
            or resize(0, second, -delta, true)
            or resize(0, first, delta, false)
            or resize(0, second, -delta, false)
    end, { desc = desc })
    map_set({ "n" }, border_to_reverse_key[border], function()
        local _ = resize(0, second, -delta, true)
            or resize(0, first, delta, true)
            or resize(0, second, -delta, false)
            or resize(0, first, delta, false)
    end, { desc = desc_reverse })
end
