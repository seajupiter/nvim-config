return {
    {
        "lervag/vimtex",
        lazy = false, -- we don't want to lazy load VimTeX
        -- tag = "v2.15", -- uncomment to pin to a specific release
        -- ft = { "tex", "latex" },
        init = function()
            vim.g.vimtex_view_method = "skim"
            vim.g.vimtex_view_skim_sync = 1
            vim.g.vimtex_view_skim_activate = 0
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_mappings_disable = {
                i = { "]]" },
            }
        end,
    },
}
