return {
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
        dependencies = {
            "folke/noice.nvim",
        },
        event = "LspAttach",
    },
}
