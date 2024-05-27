return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/neoconf.nvim",
                cmd = "Neoconf",
            },
        },
        config = function()
            require("neoconf").setup()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
}
