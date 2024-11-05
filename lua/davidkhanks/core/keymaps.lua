vim.g.mapleader = " "
-- File Explorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Window Commands
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split window vertically" }) -- Split vertically
vim.keymap.set("n", "<leader>wh", "<C-W>s", { desc = "Split window horizontally" }) -- Split horizontally
vim.keymap.set("n", "<leader>we", "<C-W>=", { desc = "Make splits equal" }) -- Make windows equal size
vim.keymap.set("n", "<leader>wd", "<C-W>q", { desc = "Close window" }) -- Close window

-- Numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- Increment number
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Deccrement number" }) -- Deccrement number

-- neogit
vim.keymap.set("n", "<leader>gs", ":Neogit<CR>", { desc = "Open neogit status buffer" })

-- Defined in vim-maximizer.lua
-- vim.keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- Buffer commands
vim.keymap.set("n", "<leader>bd", ":bp|sp|bn|bd<CR>", { desc = "Kill the current buffer" }) -- Kill the current buffer and switch the next one
vim.keymap.set("n", "<leader>bD", ":w|%bd|e#<CR>", { desc = "Kill all other buffers" }) -- save this buffer then, kill all other buffers
vim.keymap.set("n", "<leader>QQ", ":w|%bd|e#<CR>:q!<CR>", { desc = "Kill all buffers and quit" }) -- save this buffer then kill all other buffers and force quit

-- File commands
vim.keymap.set("n", "<leader>fs", ":write<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<leader>fS", ":wall<CR>", { desc = "Save all buffers" })

-- Movement commands
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv<ESC>'", { desc = "Move current selection down a line" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv<ESC>'", { desc = "Move current selection up a line" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join selected lines together" })
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "nzzzv")

-- Paste and send replaced data to void buffer
vim.keymap.set("x", "<leader>P", '"_dp', { desc = "Paste and discard replaced text" })

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+y', { desc = "Yank to system clipboard" })

-- Paste from system clipboard
vim.keymap.set("n", "<leader>pp", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>pp", '"+p', { desc = "Paste from system clipboard" })

-- Delete to system clipboard
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete to system clipboard" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete to system clipboard" })

-- Tabs
vim.keymap.set("n", "<leader>tc", ":tabnew<CR>", { desc = "Create new tab" })
vim.keymap.set("n", "<leader>td", ":tabc<CR>", { desc = "Delete tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tf", ":tabfirst<CR>", { desc = "First tab" })
vim.keymap.set("n", "<leader>tl", ":tablast<CR>", { desc = "Last tab" })

-- Kill Q because it sucks
vim.keymap.set("n", "Q", "<nop>", { desc = "No Op" })

-- Start a new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Start new tmux session" })
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace all instances of current word
vim.keymap.set(
	"n",
	"<leader>ew",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace current word" }
)

-- Set current file to be executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Set executable file permissions" })

-- Source "shout out"
vim.keymap.set("n", "<leader>so", function()
	vim.cmd("so")
end, { desc = "Source the current file" })

-- Go to last buffer
vim.keymap.set("n", "<leader><Tab>", function()
	vim.cmd("edit #")
end, { desc = "Jump to last buffer" })

-- telescope
-- vim.keymap.set('n', '<leader>pf', "<cmd>Telescope find_files<CR>")
-- vim.keymap.set('n', '<leader>sp', "<cmd>Telescope live_grep<CR>")
-- vim.keymap.set('n', '<leader>ss', "<cmd>Telescope current_buffer_fuzzy_find<CR>")
-- vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<CR>")
-- vim.keymap.set('n', '<C-p>', "<cmd>Telescope git_files<CR>")
-- vim.keymap.set('n', '<leader>ggb', "<cmd>Telescope git_branches<CR>")
-- vim.keymap.set('n', '<leader>ggs', "<cmd>Telescope git_status<CR>")
-- vim.keymap.set('n', '<leader>gsl', "<cmd>Telescope git_stash<CR>")
-- vim.keymap.set('n', '<leader>gw', "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
-- vim.keymap.set('n', '<leader>gwc', "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
