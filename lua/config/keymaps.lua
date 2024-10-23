local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.cmd [[
    " swap ; and :
    noremap ; :
    noremap : ;

    " better j and k
    map j gj
    map k gk
    map <Up> gk
    map <Down> gj
    imap <Up> <C-o>gk
    imap <Down> <C-o>gj
]]

-- noh
map("n", "<Esc>", ":noh<CR><Esc>", opts)

-- quick save
map("n", "<D-s>", ":w<CR>", opts)
map("i", "<D-s>", "<C-o>:w<CR>", opts)

for i = 1, 9, 1 do
    vim.keymap.set("n", string.format("<C-%s>", i), function()
        vim.api.nvim_set_current_buf(vim.t.bufs[i])
    end)
end

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

-- Fast saving and quiting
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- better indenting
map("v", ">", ">gv", { desc = "Indent" })
map("v", "<", "<gv", { desc = "Indent" })

-- Move to start/end of line
map({ "n", "x", "o" }, "H", "^", opts)
map({ "n", "x", "o" }, "L", "g_", opts)

-- Manipulating tabs
map("n", "]t", ":tabnext<CR>", opts)
map("n", "[t", ":tabprevious<CR>", opts)
map("n", "<leader><backspace>", ":tabclose<CR>", opts)

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

-- FzfLua
map("n", "?", "<cmd>FzfLua resume<cr>", opts)
map("n", "<C-s>", "<cmd>FzfLua lgrep_curbuf<CR>", opts)
map("n", "<leader>o", "<cmd>FzfLua buffers<CR>", opts)
map("n", "<leader><leader>", "<cmd>FzfLua files<CR>", opts)
map("n", "<leader>fk", ":FzfLua keymaps<CR>", opts)
map("n", "<leader>fw", "<cmd>FzfLua live_grep_native<CR>", opts)

-- Terminal
map(
    { "n", "t" },
    "<C-;>",
    "<cmd>ToggleTerm direction=vertical<CR>",
    { desc = "terminal toggle term" }
)

map(
    { "n", "t" },
    "<C-'>",
    "<cmd>ToggleTerm direction=float<CR>",
    { desc = "terminal toggle term" }
)

map(
    { "n", "t" },
    "<C-`>",
    "<cmd>ToggleTerm direction=horizontal<CR>",
    { desc = "terminal toggle term" }
)

-- NvimTree
map(
    "n",
    "<leader>e",
    "<cmd>NvimTreeToggle<CR>",
    { desc = "nvimtree toggle window" }
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

-- move lines arround
map(
    { "n" },
    "<M-Up>",
    "<cmd>m-2<CR>",
    { desc = "Move Line Up (Insert)", noremap = true, silent = true }
)
map(
    { "n" },
    "<M-Down>",
    "<cmd>m+<CR>",
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
map(
    "x",
    "K",
    ":move '<-2<CR>gv-gv",
    { desc = "Move Line Up (Visual)", noremap = true, silent = true }
)
map(
    "x",
    "J",
    ":move '>+1<CR>gv-gv",
    { desc = "Move Line Down (Visual)", noremap = true, silent = true }
)

-- Git
map("n", "<leader>gl", ":LazyGit<CR>", { desc = "LazyGit" })
