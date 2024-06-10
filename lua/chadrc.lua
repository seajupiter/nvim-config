---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
    theme = "bearded-arc",
    theme_toggle = { "bearded-arc", "one_light" },

    hl_override = highlights.override,
    hl_add = highlights.add,

    cmp = {
        icons = true,
        style = "default",
        selected_item_bg = "simple",
    },

    nvdash = {
        load_on_startup = true,
        header = {
            "                                   ",
            "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
            "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
            "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
            "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
            "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
            "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
            "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
            " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
            " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
            "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
            "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ",
            "                                   ",
        },
        buttons = {
            { "  Find File", "Spc f f", "Telescope find_files" },
            { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
            { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
            { "  Bookmarks", "Spc m a", "Telescope marks" },
            { "  Themes", "Spc t c", "Telescope themes" },
            { "  Mappings", "Spc c h", "NvCheatsheet" },
        },
    },

    statusline = {
        -- order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" }, -- default
        order = {
            "mode",
            "file",
            "record_macro",
            "diagnostics",
            "git",
            "%=",
            "lsp_msg",
            "%=",
            -- "lsp",
            "copilot",
            "cursor",
            "cwd",
        }, -- vscode style
        modules = {
            copilot = function()
                --- @diagnostic disable: deprecated
                for _, client in pairs(vim.lsp.get_active_clients()) do
                    if client.name == "copilot" then
                        return "%#TeSTTCopilot#" .. "   "
                    end
                end
                return "%#TeSTTCopilot#" .. "   "
            end,

            record_macro = function()
                if require("noice").api.statusline.mode.get() then
                    return "  " .. vim.fn.reg_recording()
                end
            end,
        },
        theme = "default",
    },

    telescope = {
        style = "bordered",
    },

    term = {
        hl = "Normal:term,WinSeparator:WinSeparator",
        sizes = { sp = 0.3, vsp = 0.4 },
        float = {
            relative = "editor",
            row = 0.1,
            col = 0.1,
            width = 0.8,
            height = 0.8,
            border = "rounded",
        },
    },
}

return M
