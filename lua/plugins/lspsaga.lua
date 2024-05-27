return {
    {
        "nvimdev/lspsaga.nvim",
        config = function()
            require "configs.lspsaga"
        end,
        event = "LspAttach",
    },
}
