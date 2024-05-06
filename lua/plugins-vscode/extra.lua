return {
    -- Add/change/delete surrounding delimiter pairs with ease
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end,
    },

    -- Enhanced f/t motions for Leap
    {
        "ggandor/flit.nvim",
        keys = function()
            ---@type LazyKeys[]
            local ret = {}
            for _, key in ipairs({ "f", "F", "t", "T" }) do
                ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
            end
            return ret
        end,
        multiline = true,
        opts = { labeled_modes = "nx" },
    },
    -- mouse replacement
    {
        "ggandor/leap.nvim",
        keys = {
            { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
            { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
            { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
        },
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
            vim.keymap.del({ "x", "o" }, "x")
            vim.keymap.del({ "x", "o" }, "X")
        end,
    },
    -- Camel case/snake case motion
    {
        "bkad/CamelCaseMotion",
        keys = {
            { "e",  "<Plug>CamelCaseMotion_e",  mode = { "n", "o", "x" } },
            { "b",  "<Plug>CamelCaseMotion_b",  mode = { "n", "o", "x" } },
            { "ge", "<Plug>CamelCaseMotion_ge", mode = { "n", "o", "x" } },
            { "w",  "<Plug>CamelCaseMotion_w",  mode = { "n", "o", "x" } },
            { "iW", "<Plug>CamelCaseMotion_iw", mode = { "o", "x" } },
            { "iB", "<Plug>CamelCaseMotion_ib", mode = { "o", "x" } },
            { "iE", "<Plug>CamelCaseMotion_ie", mode = { "o", "x" } },
        },
    },
}
