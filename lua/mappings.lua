require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del
local opts = { noremap = true, silent = true }

vim.cmd [[
    " Get rid of yanking of d
    nnoremap p "+p
    nnoremap P "+P
    nnoremap x "+x
    nnoremap y "+y
    nnoremap d "_d
    vnoremap p "+p
    vnoremap P "+P
    vnoremap x "+x
    vnoremap y "+y
    vnoremap d "_d
    xnoremap p "+p
    xnoremap P "+P
    xnoremap x "+x
    xnoremap y "+y
    xnoremap d "_

    " better j and k
    map j gj
    map k gk
    map <Up> gk
    map <Down> gj
    imap <Up> <C-o>gk
    imap <Down> <C-o>gj
]]

map("i", "jk", "<ESC>")

for i = 1, 9, 1 do
    vim.keymap.set("n", string.format("<C-%s>", i), function()
        vim.api.nvim_set_current_buf(vim.t.bufs[i])
    end)
end

map("n", "]b", function()
    require("nvchad.tabufline").next()
end, { desc = "next buffer" })
map("n", "[b", function()
    require("nvchad.tabufline").prev()
end, { desc = "prev buffer" })
map("n", "Q", function()
    require("nvchad.tabufline").close_buffer()
end, { desc = "close buffer" })
del("n", "<leader>x")

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":qa!<CR>", opts)

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
map("n", "YY", "va{Vy", opts)

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Manipulating tabs
map("n", "]t", ":tabnext<CR>", opts)
map("n", "[t", ":tabprevious<CR>", opts)
map("n", "<Leader><backspace>", ":tabclose<CR>", opts)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

map("n", "?", "<cmd>Telescope resume<cr>", opts)
map("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)
map("n", "<leader>o", ":Telescope buffers<CR>", opts)
map("n", "<leader><leader>", ":Telescope find_files<CR>", opts)
map("n", "<leader>fk", ":Telescope keymaps<CR>", opts)

-- Split line with X
map(
    "n",
    "X",
    ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>",
    { silent = true }
)

-- Select all
map("n", "<C-a>", "ggVG", opts)

-- write file in current directory
-- :w %:h/<new-file-name>
map("n", "<C-n>", ":w %:h/", opts)

-- ctrl + x to cut full line
map("n", "<C-x>", "dd", opts)

-- Terminal
map({ "n", "t" }, "<C-;>", function()
    require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<C-`>", function()
    require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal new horizontal term" })

map({ "n", "t" }, "<C-'>", function()
    require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- NvimTree
map(
    "n",
    "<leader><Tab>",
    "<cmd>NvimTreeToggle<CR>",
    { desc = "nvimtree toggle window" }
)
map(
    "n",
    "<leader>e",
    "<cmd>NvimTreeFocus<CR>",
    { desc = "nvimtree focus window" }
)
