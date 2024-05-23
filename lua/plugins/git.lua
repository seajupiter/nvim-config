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
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim", -- required
            "sindrets/diffview.nvim", -- optional - Diff integration

            -- Only one of these is needed, not both.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua", -- optional
        },
        cmd = "Neogit",
        config = true,
    },
    {
        "FabijanZulj/blame.nvim",
        cmd = "BlameToggle",
        config = function()
            require("blame").setup()
        end,
    },
    -- not git, but it's okay
    "mbbill/undotree",
}
