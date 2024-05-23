return {
    -- Autotags
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        opts = {},
    },
    -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
    { "joosepalviste/nvim-ts-context-commentstring", lazy = true },
    -- Smooth scrolling neovim plugin written in lua
    {
        "karb94/neoscroll.nvim",
        event = "BufEnter",
        config = function()
            require("neoscroll").setup {
                stop_eof = true,
                easing_function = "sine",
                hide_cursor = true,
                cursor_scrolls_alone = true,
            }
        end,
    },

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

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        lazy = false,
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
        config = function()
            require("barbecue").setup {
                create_autocmd = false, -- prevent barbecue from updating itself automatically
            }

            vim.api.nvim_create_autocmd({
                "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
                "BufWinEnter",
                "CursorHold",
                "InsertLeave",

                -- include this if you have set `show_modified` to `true`
                -- "BufModifiedSet",
            }, {
                group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                callback = function()
                    require("barbecue.ui").update()
                end,
            })
        end,
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
