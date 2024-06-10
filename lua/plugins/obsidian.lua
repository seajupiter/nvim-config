local vaults_path = {
    "/Users/wyt/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal Dashboard",
}

return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    event = {
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        "BufReadPre /Users/wyt/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal Dashboard/**.md",
        "BufNewFile /Users/wyt/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal Dashboard/**.md",
    },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = "dashboard",
                path = "/Users/wyt/Library/Mobile Documents/iCloud~md~obsidian/Documents/Personal Dashboard",
            },
        },
        -- see below for full list of options 👇
    },
}
