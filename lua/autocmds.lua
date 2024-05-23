local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
    command = "silent !kitty @ set-spacing margin=0",
})

autocmd("VimLeavePre", {
    command = "silent !kitty @ set-spacing margin=5",
})

autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format { bufnr = args.buf }
    end,
})
