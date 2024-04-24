return {
  {
    "folke/neoconf.nvim",
    command = "Neoconf",
    lazy = true,
    config = function ()
      require("neoconf").setup()
    end
  },
}
