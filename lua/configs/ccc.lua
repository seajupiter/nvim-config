local status_ok, ccc = pcall(require, "ccc")

if not status_ok then
    return
end

local opts = {
    highlighter = {
        auto_enable = true,
        lsp = true,
    },
}

ccc.setup(opts)
