local status_ok, noice = pcall(require, "noice")

if not status_ok then
    return
end

local opts = {
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
        hover = {
            enabled = false,
        },

        signature = {
            enabled = false,
        },

        progress = {
            enabled = false,
        },
    },

    -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        inc_rename = true, -- incremental rename
    },

    -- Configure cmdline
    cmdline = {
        format = {
            cmdline = { pattern = "^:", icon = "", lang = "vim" },
            search_down = {
                kind = "search",
                pattern = "^/",
                icon = " ",
                lang = "regex",
            },
            search_up = {
                kind = "search",
                pattern = "^%?",
                icon = " ",
                lang = "regex",
            },
            filter = { pattern = "^:%s*!", icon = "󰻮", lang = "bash" },
            lua = {
                pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
                icon = "",
                lang = "lua",
            },
            help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
            input = {}, -- Used by input()
        },
    },

    -- Configure routes
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "written",
            },
            opts = { skip = true },
        },
        {
            filter = {
                event = "msg_show",
                kind = "search_count",
            },
            opts = { skip = true },
        },
        {
            filter = {
                event = "msg_show",
                kind = "",
            },
            opts = { skip = true },
        },
    },
}

noice.setup(opts)
