return {

  -- catppuccin

  {

    "catppuccin/nvim",

    name = "catppuccin",

    priority = 1000

  },

  { "ellisonleao/glow.nvim", name = "glow.nvim", config = true, cmd = "Glow" },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  }

}
