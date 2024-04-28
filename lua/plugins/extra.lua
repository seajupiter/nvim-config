return {
    -- Autotags
    {
        "windwp/nvim-ts-autotag",
        lazy = true,
        opts = {},
    },

    -- delete buffer
    {
        "echasnovski/mini.bufremove",
        version = "*",
        config = function()
            require("mini.bufremove").setup()
            vim.keymap.set("n", "Q", "<Cmd>lua MiniBufremove.delete()<CR>", { desc = "close current buffer" })
        end,
    },
    -- comments
    {
        "numToStr/Comment.nvim",
        opts = {},
        lazy = false,
    },
    -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
    { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

    -- Neovim plugin to improve the default vim.ui interfaces
    {
        "stevearc/dressing.nvim",
        dependencies = { "MunifTanjim/nui.nvim" },
        opts = {},
        config = function()
            require("dressing").setup()
        end,
    },

    -- Neovim notifications and LSP progress messages
    {
        "j-hui/fidget.nvim",
        branch = "legacy",
        enabled = false,
        config = function()
            require("fidget").setup({
                window = { blend = 0 },
            })
        end,
    },

    -- Smooth scrolling neovim plugin written in lua
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("neoscroll").setup({
                stop_eof = true,
                easing_function = "sine",
                hide_cursor = true,
                cursor_scrolls_alone = true,
            })
        end,
    },

    -- find and replace
    {
        "windwp/nvim-spectre",
        event = "BufRead",
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

    -- Neovim Lua plugin to automatically manage character pairs. Part of 'mini.nvim' library.
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        config = function(_, opts)
            require("mini.pairs").setup(opts)
        end,
    },

    -- editor config support
    {
        "editorconfig/editorconfig-vim",
    },

    -- Enhanced f/t motions for Leap
    {
        "ggandor/flit.nvim",
        keys = function()
            ---@type LazyKeys[]
            local ret = {}
            for _, key in ipairs({ "f", "F", "t", "T" }) do
                ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
            end
            return ret
        end,
        multiline = true,
        opts = { labeled_modes = "nx" },
    },
    -- mouse replacement
    {
        "ggandor/leap.nvim",
        keys = {
            { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
            { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
        end,
    },

    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            -- configurations go here
        },
        config = function()
            require("barbecue").setup({
                create_autocmd = false, -- prevent barbecue from updating itself automatically
            })

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

    -- better code annotation
    {
        "danymat/neogen",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local neogen = require("neogen")

            neogen.setup({
                snippet_engine = "luasnip",
            })
        end,
        -- version = "*"
    },
}
