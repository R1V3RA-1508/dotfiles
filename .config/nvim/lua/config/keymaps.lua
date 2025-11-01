-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map({ 'n', 'i' }, '<C-r>', '<cmd>undo<cr>', { desc = 'Undo' })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map({ "i", "x", "n", "s" }, "<C-t>", "<cmd>NvimTreeFocus<cr>", { desc = "Focus nvim-tree" })
map({ "n" }, "<tab>q", "<cmd>tab previous<cr>", { desc = "Previous tab" })
map({ "n" }, "<tab>e", "<cmd>tab next<cr>", { desc = "Next tab" })
map({ "n" }, "<tab>c", "<cmd>tab close<cr>", { desc = "Close tab" })
map({ "n" }, "<tab>n", "<cmd>tab new<cr>", { desc = "New tab" })
