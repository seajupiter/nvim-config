local configs = require "nvchad.configs.lspconfig"

local servers = {
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
    opts.on_init = configs.on_init
    opts.on_attach = configs.on_attach
    if opts.capabilities == nil then
        opts.capabilities = configs.capabilities
    else
        opts.capabilities =
            vim.tbl_deep_extend("keep", opts.capabilities, configs.capabilities)
    end
    require("lspconfig")[name].setup(opts)
end
