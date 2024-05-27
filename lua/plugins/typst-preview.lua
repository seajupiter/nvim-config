return {
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "0.1.*",
        build = function()
            require("typst-preview").update()
        end,
        config = function()
            require("typst-preview").setup {
                open_cmd = "open %s -a Firefox.app",
                invert_colors = "auto",
            }
        end,
    },
}
