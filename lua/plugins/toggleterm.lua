return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<F12>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = false,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })
    vim.keymap.set({"n", "i", "t"}, "<c-`>", '<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>')
    vim.keymap.set({"n", "i", "t"}, "<c-;>", '<Cmd>exe v:count1 . "ToggleTerm direction=vertical"<CR>')
    vim.keymap.set({"n", "i", "t"}, "<c-t>", '<Cmd>exe v:count1 . "ToggleTerm direction=tab"<CR>')
    vim.keymap.set({"n", "i", "t"}, "<c-'>", '<Cmd>exe v:count1 . "ToggleTerm direction=float"<CR>')
  end,
}
