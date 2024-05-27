return {
    {
        "j-hui/fidget.nvim",
        config = function()
            require "configs.fidget"
        end,
        event = "BufRead",
    },
}
