require "nvchad.mappings"

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
    xnoremap d "_d

    " better j and k
    map j gj
    map k gk
    map <Up> gk
    map <Down> gj
    imap <Up> <C-o>gk
    imap <Down> <C-o>gj
]]

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

-- Fast saving and quiting
map("n", "<Leader>w", ":w<CR>", opts)
map("n", "<Leader>q", ":q<CR>", opts)

-- better indenting
map("v", ">", ">gv", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Indent" })

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Manipulating tabs
map("n", "]t", ":tabnext<CR>", opts)
map("n", "[t", ":tabprevious<CR>", opts)
map("n", "<Leader><backspace>", ":tabclose<CR>", opts)

-- Panes resizing
map("n", "+", ":vertical resize +5<CR>", opts)
map("n", "_", ":vertical resize -5<CR>", opts)
map("n", "=", ":resize +5<CR>", opts)
map("n", "-", ":resize -5<CR>", opts)

-- better cursor placement
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)
map("n", "*", "*zz", opts)
map("n", "#", "#zz", opts)
map("n", "g*", "g*zz", opts)
map("n", "g#", "g#zz", opts)

-- Telescope
map(
    "n",
    "<leader>tc",
    ":Telescope themes<CR>",
    { desc = "telescope nvchad themes" }
)
map("n", "?", "<cmd>Telescope resume<cr>", opts)
map("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)
map("n", "<leader>o", ":Telescope buffers<CR>", opts)
map("n", "<leader><leader>", ":Telescope find_files<CR>", opts)
map("n", "<leader>fk", ":Telescope keymaps<CR>", opts)

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

-- Lspsaga
map(
    "n",
    "<leader>lf",
    "<cmd> Lspsaga diagnostic_jump_next <cr>",
    { desc = "Jump to next diagnostic" }
)

-- IncRename
map("n", "<leader>cr", function()
    return ":IncRename " .. vim.fn.expand "<cword>"
end, { desc = "Inc Rename word under cursor" })

-- Copilot
map("n", "<leader>ct", ":CopilotChatToggle<cr>")
map({ "v", "x" }, "<leader>ce", ":CopilotChatExplaint<cr>")
map("n", "<leader>ci", function()
    local input = vim.fn.input "🤖 CopilotChat - Input: "
    if input ~= "" then
        vim.cmd("CopilotChat " .. input)
    end
end, { desc = "🤖 CopilotChat - Input" })

map(
    { "n", "i" },
    "<M-Up>",
    "<Esc><cmd>m-2<CR>",
    { desc = "Move Line Up (Insert)", noremap = true, silent = true }
)
map(
    { "n", "i" },
    "<M-Down>",
    "<Esc><cmd>m+<CR>",
    { desc = "Move Line Down (Insert)", noremap = true, silent = true }
)
map(
    "x",
    "<M-Up>",
    ":move '<-2<CR>gv-gv",
    { desc = "Move Line Up (Visual)", noremap = true, silent = true }
)
map(
    "x",
    "<M-Down>",
    ":move '>+1<CR>gv-gv",
    { desc = "Move Line Down (Visual)", noremap = true, silent = true }
)
