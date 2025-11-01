-- Keybind Config

-- Close Current Window
vim.keymap.set("n", "<leader>cv", "<cmd>q<CR>", { desc = "[C]lose [V]iew" })

-- Open netrw Window
vim.keymap.set("n", "<leader>vn", vim.cmd.Ex, { desc = "[V]iew [N]etrw" })

-- Remove Search Highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlights" })

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
