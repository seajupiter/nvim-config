return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "quangnguyen30192/cmp-nvim-ultisnips",
                config = function()
                    -- optional call to setup (see customization section)
                    require("cmp_nvim_ultisnips").setup {}
                end,
                -- If you want to enable filetype detection based on treesitter:
                -- requires = { "nvim-treesitter/nvim-treesitter" },
            },
            { "micangl/cmp-vimtex" },
            {
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        config = function()
            local cmp_ultisnips_mappings = require "cmp_nvim_ultisnips.mappings"
            local cmp = require "cmp"
            require("cmp").setup {
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                window = {
                    completion = {
                        side_padding = 1,
                        scrollbar = false,
                        border = "rounded",
                    },
                    documentation = {
                        border = "rounded",
                    },
                },
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
                    end,
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "nvim_lua" },
                    { name = "path" },
                    { name = "ultisnips" },
                    { name = "vimtex" },
                },
                -- recommended configuration for <Tab> people:
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    },
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
                    end, {
                        "i",
                        "s", --[[ "c" (to enable the mapping in command mode) ]]
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        cmp_ultisnips_mappings.jump_backwards(fallback)
                    end, {
                        "i",
                        "s", --[[ "c" (to enable the mapping in command mode) ]]
                    }),
                },
            }
        end,
    },
}
