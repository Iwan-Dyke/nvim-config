-- Basic Keymaps
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file", silent = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit", silent = true })

--Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<BS>", "<C-w>h", { desc = "Move to left window (macOS fix)" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Clear Search Highlighting
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { desc = "Clear search highlight", silent = true })
