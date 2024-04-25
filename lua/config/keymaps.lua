local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Get rid of yanking of d
vim.cmd([[
    nnoremap p "0p
    nnoremap P "0P
    vnoremap p "0p
    vnoremap P "0P
    vnoremap x "0x
    nnoremap x "0x
    nnoremap y "0y
    vnoremap y "0y
]])

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Move selected line / block of text in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving
map("n", "<Leader>w", ":write!<CR>", opts)
map("n", "<Leader>q", ":q!<CR>", opts)

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
map("n", "YY", "va{Vy", opts)

-- Move line on the screen rather than by line in the file
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

-- Exit on jj and jk
-- map("i", "jj", "<ESC>", opts)
-- map("i", "jk", "<ESC>", opts)

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Navigate buffers
map("n", "]b", ":bnext<CR>", opts)
map("n", "[b", ":bprevious<CR>", opts)
map("n", "<D-Right>", "<cmd>bnext<CR>", opts)
map({ "n", "i" }, "<D-Left>", "<cmd>bprevious<CR>", opts)

-- Navigate tabs
map("n", "]t", ":tabnext<CR>", opts)
map("n", "[t", ":tabprevious<CR>", opts)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>")
map("n", "_", ":vertical resize -5<CR>")
map("n", "=", ":resize +5<CR>")
map("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
-- map("n", "<CR>", "ciw", opts)
-- map("n", "<BS>", "ci", opts)

map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

-- map ; to resume last search
-- map("n", ";", "<cmd>Telescope resume<cr>", opts)

-- search current buffer
map("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- search modified files
map("n", "<Leader>m", ":Telescope git_status<CR>", opts)

-- Split line with X
map("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- Select all
map("n", "<C-a>", "ggVG", opts)

-- write file in current directory
-- :w %:h/<new-file-name>
map("n", "<C-n>", ":w %:h/", opts)

-- delete forward
-- w{number}dw
-- delete backward
-- w{number}db

map("n", "<C-P>", ':lua require("config.utils").toggle_go_test()<CR>', opts)

map("n", "<Esc>", ":nohlsearch<CR>", opts)

-- ctrl + x to cut full line
map("n", "<C-x>", "dd", opts)

-- window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
