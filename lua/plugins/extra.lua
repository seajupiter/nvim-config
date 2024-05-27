return {
    -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
    { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

    -- find and replace
    {
        "windwp/nvim-spectre",
        cmd = "Spectre",
    },

    -- Add/change/delete surrounding delimiter pairs with ease
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- Heuristically set buffer options
    {
        "tpope/vim-sleuth",
    },

    -- editor config support
    {
        "editorconfig/editorconfig-vim",
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = true,
                },
            },
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
        },
    },

    -- Camel case/snake case motion
    {
        "bkad/CamelCaseMotion",
        keys = {
            { "e", "<Plug>CamelCaseMotion_e", mode = { "n", "o", "x" } },
            { "b", "<Plug>CamelCaseMotion_b", mode = { "n", "o", "x" } },
            { "ge", "<Plug>CamelCaseMotion_ge", mode = { "n", "o", "x" } },
            { "w", "<Plug>CamelCaseMotion_w", mode = { "n", "o", "x" } },
            { "iW", "<Plug>CamelCaseMotion_iw", mode = { "o", "x" } },
            { "iB", "<Plug>CamelCaseMotion_ib", mode = { "o", "x" } },
            { "iE", "<Plug>CamelCaseMotion_ie", mode = { "o", "x" } },
        },
    },

    -- Disable indent guides
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
}
