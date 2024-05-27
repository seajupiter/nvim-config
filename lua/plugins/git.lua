return {
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
        },
    },
    {
        "FabijanZulj/blame.nvim",
        cmd = "BlameToggle",
        config = function()
            require("blame").setup()
        end,
    },
}
