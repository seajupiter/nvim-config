local lspconfig = require("lspconfig")

lspconfig.tinymist.setup({
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
})

lspconfig.clangd.setup({
    capabilities = {
        offsetEncoding = { "utf-16" },
    },
})

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                -- Tells lua_ls where to find all the Lua files that you have loaded
                -- for your neovim configuration.
                library = {
                    "${3rd}/luv/library",
                    unpack(vim.api.nvim_get_runtime_file("", true)),
                },
                -- If lua_ls is really slow on your computer, you can try this instead:
                -- library = { vim.env.VIMRUNTIME },
            },
            completion = {
                callSnippet = "Replace",
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
        },
    },
})

lspconfig.vimls.setup({
    filetypes = { "vim" },
})

lspconfig.pyright.setup({})

lspconfig.rust_analyzer.setup({})

