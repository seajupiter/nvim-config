return {
    {
        "stevearc/overseer.nvim",
        opts = {},
        cmd = { "OverseerRun", "OverseerToggle" },
        config = function()
            require("overseer").setup()
        end,
    },
}
