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

autocmd({ "VimEnter" }, {
    callback = function()
        vim.defer_fn(function()
            local api = require "nvim-tree.api"
            local view = require "nvim-tree.view"

            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                local name = vim.api.nvim_buf_get_name(buf)
                if name:match "NvimTree*" then
                    if not view.is_visible() then
                        api.tree.toggle { focus = false, find_file = true }
                    end
                    break
                end
            end
        end, 1) -- Jank defer to give lazy time to init the plugin, just 1 works for me increase as needed
    end,
})
