vim.g.mapleader = " " -- remap leader to <space> key
vim.keymap.set("i", "jk", "<Esc>", { desc = "jk combination take us to normal mode" })
vim.keymap.set("n", ";", ":", { desc = "semicolon is colon when in normal mode" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Shifts a whole selected block one line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Shifts a whole selected block one line up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Ctrl+d is page down and center screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Ctrl+d is page up and center screen" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Searches for next match and center screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Searches for previous match and center screen" })
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Searches for previous match and center screen" })
vim.keymap.set("n", "<leader>y", '"+y<CR>', { desc = "Add current yanked text to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y<CR>', { desc = "Add current yanked text to clipboard" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Removes any command from Q" })
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>", { desc = "Not sure, create tmux tab" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Go to next error" })
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Go to previous error" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Go to next location" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Go to previous location" })
vim.keymap.set("n", "*", "*zz", { desc = "search and center screen" })
vim.keymap.set(
  "n",
  "<leader>s",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Live text substitution throughout the whole file" }
)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make current file executable" })
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format()
end, { desc = "Format current file" })
vim.keymap.set("n", "<leader>ss", ":Telescope live_grep <CR>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>e", ":Neotree float toggle<CR>")
-- debug keymaps
vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>", { desc = "Terminate debug session" })
vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>", { desc = "Step Over" })
