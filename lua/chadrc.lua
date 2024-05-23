local M = {}

M.ui = {
    ------------------------------- base46 -------------------------------------
    -- hl = highlights
    hl_add = {},
    hl_override = {},
    changed_themes = {},
    theme_toggle = { "bearded-arc", "one_light" },
    theme = "bearded-arc", -- default theme
    transparency = false,

    cmp = {
        icons = true,
        lspkind_text = true,
        style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    },

    telescope = { style = "borderless" }, -- borderless / bordered

    ------------------------------- nvchad_ui modules -----------------------------
    statusline = {
        theme = "default", -- default/vscode/vscode_colored/minimal
        -- default/round/block/arrow separators work only for default statusline theme
        -- round and block will work for minimal theme only
        separator_style = "default",
        order = nil,
        modules = nil,
    },
    -- lazyload it when there are 1+ buffers
    tabufline = {
        enabled = true,
        lazyload = true,
        order = { "treeOffset", "buffers", "tabs", "btns" },
        modules = nil,
    },

    nvdash = {
        load_on_startup = true,

        header = {
            "           ▄ ▄                   ",
            "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
            "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
            "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
            "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
            "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
            "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
            "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
            "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
        },

        buttons = {
            { "  Find File", "Spc f f", "Telescope find_files" },
            { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
            { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
            { "  Bookmarks", "Spc m a", "Telescope marks" },
            { "  Themes", "Spc t h", "Telescope themes" },
            { "  Mappings", "Spc c h", "NvCheatsheet" },
        },
    },

    cheatsheet = {
        theme = "simple", -- simple/grid
        excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
    },

    lsp = { signature = true },

    term = {
        hl = "Normal:term,WinSeparator:WinSeparator",
        sizes = { sp = 0.3, vsp = 0.4 },
        float = {
            relative = "editor",
            row = 0.1,
            col = 0.1,
            width = 0.8,
            height = 0.8,
            border = "single",
        },
    },
}

M.base46 = {
    extended_integrations = { "navic" },
}

return M
