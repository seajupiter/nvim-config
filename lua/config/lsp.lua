local lspconfig = require "lspconfig"
local map = vim.keymap.set

local on_attach = function(_, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end
    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
    map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
    map(
        "n",
        "<leader>sh",
        vim.lsp.buf.signature_help,
        opts "Show signature help"
    )
    map(
        "n",
        "<leader>wa",
        vim.lsp.buf.add_workspace_folder,
        opts "Add workspace folder"
    )
    map(
        "n",
        "<leader>wr",
        vim.lsp.buf.remove_workspace_folder,
        opts "Remove workspace folder"
    )

    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts "List workspace folders")

    map("n", "<leader>ra", function()
        require "nvchad.lsp.renamer"()
    end, opts "NvRenamer")

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
    map("n", "gr", vim.lsp.buf.references, opts "Show references")
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
    map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts "Code action")
end

local on_init = function(client, _)
    if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

-- Add the border on hover and on signature help popup window
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = "rounded" }
    ),
    ["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = "rounded" }
    ),
}

-- Add border to the diagnostic popup window
vim.diagnostic.config {
    float = { border = "rounded" },
}

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
    opts.handlers = handlers
    if opts.capabilities == nil then
        opts.capabilities = capabilities
    else
        opts.capabilities =
            vim.tbl_deep_extend("keep", opts.capabilities, capabilities)
    end
    lspconfig[name].setup(opts)
end
