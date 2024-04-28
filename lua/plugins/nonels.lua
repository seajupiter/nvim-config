return {
    {
        "nvimtools/none-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "jay-babu/mason-null-ls.nvim",
            "nvim-lua/plenary.nvim",
            "nvimtools/none-ls-extras.nvim",
            "gbprod/none-ls-shellcheck.nvim",
        },
        config = function()
            require("null-ls").register(require("none-ls-shellcheck.diagnostics"))
            require("null-ls").register(require("none-ls-shellcheck.code_actions"))

            local mason_null_ls = require("mason-null-ls")
            local null_ls = require("null-ls")

            local null_ls_utils = require("null-ls.utils")

            mason_null_ls.setup({})

            local formatting = null_ls.builtins.formatting
            -- local diagnostics = null_ls.builtins.diagnostics
            local code_actions = null_ls.builtins.code_actions

            -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

            null_ls.setup({
                root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),

                sources = {
                    formatting.stylua,
                    formatting.shfmt,
                    formatting.black,
                    formatting.typstfmt,
                    code_actions.gitsigns,
                    code_actions.refactoring,
                },
                -- configure format on save
                on_attach = function(client, bufnr)
                    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                                -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                                vim.lsp.buf.format({ async = false })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
