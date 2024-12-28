return {
    {
        "echasnovski/mini.surround",
        version = false,
        config = function()
            require("mini.surround").setup()
        end,
    },

    {
        "max397574/better-escape.nvim",
        event = "InsertEnter",
        config = function()
            require("better_escape").setup {
                default_mappings = false,
                mappings = {
                    i = {
                        j = {
                            k = "<Esc>",
                        },
                    },
                },
            }
        end,
    },

    { "typicode/bg.nvim", lazy = false },

    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end,
    },

    {
        "cohama/lexima.vim",
        event = "InsertEnter",
        init = function()
            vim.g.lexima_enable_basic_rulse = 1
        end,
    },

    {
        "ggandor/leap.nvim",
        config = function()
            vim.keymap.set("n", "f", "<Plug>(leap)")
            vim.keymap.set("n", "F", "<Plug>(leap-from-window)")
        end,
    },

    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                css = { "prettier" },
                html = { "prettier" },
                typst = { "typstfmt" },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
        },
        config = function(_, opts)
            require("conform").setup(opts)
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup {
                options = {
                    -- theme = "onedark",
                    component_separators = "",
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            separator = { left = "" },
                            right_padding = 2,
                        },
                    },
                    lualine_b = { "filename", "branch" },
                    lualine_c = {
                        "%=", --[[ add your center compoentnts here in place of this comment ]]
                    },
                    lualine_x = {},
                    lualine_y = { "filetype", "progress" },
                    lualine_z = {
                        {
                            "location",
                            separator = { right = "" },
                            left_padding = 2,
                        },
                    },
                },
                inactive_sections = {
                    lualine_a = { "filename" },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { "location" },
                },
                tabline = {},
                extensions = {},
            }
        end,
    },
}
