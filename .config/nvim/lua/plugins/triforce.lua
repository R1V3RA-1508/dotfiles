return {
    {
        "gisketch/triforce.nvim",
        dependencies = { "nvzone/volt" },
        config = function()
            require("triforce").setup({
                gamification_enabled = true,
            })
        end,
    },
}
