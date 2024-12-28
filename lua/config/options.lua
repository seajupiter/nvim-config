vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.breakindent = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.whichwrap = "b,s,h,l,<,>,[,],~"
vim.opt.guicursor = "n-v-c-i:block"

vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = "/Users/wyt/miniconda3/bin/python3"

if vim.g.neovide then
    vim.opt.guifont = "RobotoMono Nerd Font:h13:b"
    vim.g.neovide_window_blurred = true
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_transparency = 0.95
    vim.g.neovide_show_border = true
    vim.g.neovide_theme = "dark"
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
end
