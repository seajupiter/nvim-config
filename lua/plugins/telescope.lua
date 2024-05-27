return {
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {},
                },
            },
        },
    },
}
