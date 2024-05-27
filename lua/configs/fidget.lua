local status_ok, fidget = pcall(require, "fidget")

if not status_ok then
    return
end

local opts = {
    progress = {
        display = {
            progress_icon = { "dots_toggle" },
        },
    },
}

fidget.setup(opts)
