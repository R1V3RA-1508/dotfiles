-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
local neopywal = require("neopywal")
neopywal.setup({
    use_palette = "onedark-darker",
    transparent_background = true,
})
vim.cmd.colorscheme("neopywal")
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.wrap = false
