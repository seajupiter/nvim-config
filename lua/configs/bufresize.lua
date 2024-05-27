local status_ok, bufresize = pcall(require, "bufresize")

if not status_ok then
    return
end

local opts = {
    register = {
        trigger_events = { "BufWinEnter", "WinEnter" },
        keys = {},
    },
    resize = {
        trigger_events = {
            "VimResized",
        },
        increment = 1,
    },
}

bufresize.setup(opts)
