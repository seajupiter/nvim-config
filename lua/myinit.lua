-- local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format { bufnr = args.buf }
    end,
})

vim.opt.conceallevel = 1
