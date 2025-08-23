-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap

-- Increment/decrement number
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- DAP
keymap.set("n", "<down>", "<cmd>lua require('dap').step_over()<CR>")
keymap.set("n", "<right>", "<cmd>lua require('dap').step_into()<CR>")
keymap.set("n", "<left>", "<cmd>lua require('dap').step_out()<CR>")
keymap.set("n", "<up>", "<cmd>lua require('dap').restart()<CR>")
