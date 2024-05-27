local configs = require "nvchad.configs.lspconfig"

local on_init = configs.on_init

local on_attach = function(client, bufnr)
    configs.on_attach(client, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end
    local map = vim.keymap.set
    map(
        "n",
        "gr",
        ":Telescope lsp_references<CR>",
        opts "Telescope show references"
    )
    map(
        "n",
        "<leader>fd",
        ":Telescope diagnostics<CR>",
        opts "Telescope show diagnostics"
    )
    map(
        "n",
        "<leader>fp",
        ":Telescope lsp_document_symbols<CR>",
        opts "Telescope show document symbols"
    )
    map(
        "n",
        "<leader>fP",
        ":Telescope lsp_workspace_symbols<CR>",
        opts "Telescope show workspace symbols"
    )
    map("n", "<leader>lr", function()
        require "nvchad.lsp.renamer"()
    end, opts "Rename symbol")
    map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts "Code action")
end

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        vim.fn.expand "$VIMRUNTIME/lua",
                        vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                        vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types",
                        vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy",
                    },
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
            },
        },
    },

    html = {},

    bashls = {},

    pyright = {
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    typeCheckingMode = "basic",
                },
            },
        },
    },

    rust_analyzer = {},

    clangd = {
        cmd = {
            "clangd",
            "--enable-config",
        },
        capabilities = {
            offsetEncoding = { "utf-16" },
        },
    },

    tinymist = {
        --- todo: these configuration from lspconfig maybe broken
        single_file_support = true,
        root_dir = function()
            return vim.fn.getcwd()
        end,
        --- See [Tinymist Server Configuration](https://github.com/Myriad-Dreamin/tinymist/blob/main/Configuration.md) for references.
        settings = {
            exportPdf = "onSave",
            outputPath = "$root/$dir/$name",
        },
    },
}

for name, opts in pairs(servers) do
    opts.on_init = on_init
    opts.on_attach = on_attach
    if opts.capabilities == nil then
        opts.capabilities = configs.capabilities
    else
        opts.capabilities =
            vim.tbl_deep_extend("keep", opts.capabilities, configs.capabilities)
    end
    require("lspconfig")[name].setup(opts)
end
