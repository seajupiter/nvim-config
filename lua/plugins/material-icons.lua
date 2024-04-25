return {
    {
        "DaikyXendo/nvim-material-icon",
        lazy = true,
        config = function()
            require("nvim-material-icon").setup({
                -- globally enable different highlight colors per icon (default to true)
                -- if set to false all icons will have the default icon's color
                color_icons = true,
                -- globally enable default icons (default to false)
                -- will get overriden by `get_icons` option
                default = true,
            })
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        dependencies = {
            "DaikyXendo/nvim-material-icon",
        },
        config = function()
            local web_devicons_ok, web_devicons = pcall(require, "nvim-web-devicons")
            if not web_devicons_ok then
                return
            end

            local material_icon_ok, material_icon = pcall(require, "nvim-material-icon")
            if not material_icon_ok then
                return
            end

            web_devicons.setup({
                override = material_icon.get_icons(),
            })
        end,
    },
}
