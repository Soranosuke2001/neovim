-- Keybind Config
local K = {}

-- Variables
local tel_builtin = require("telescope.builtin")

-- Close Current Window
vim.keymap.set("n", "<leader>cv", "<cmd>q<CR>", { desc = "[C]lose [V]iew" })

-- Open netrw Window
vim.keymap.set("n", "<leader>vn", vim.cmd.Ex, { desc = "[V]iew [N]etrw" })

-- Remove Search Highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlights" })

-- Diagnostics
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Telescope Search
vim.keymap.set("n", "<leader>sf", tel_builtin.find_files, { desc = "Telescope [S]earch [F]ile" })
vim.keymap.set("n", "<leader>sg", tel_builtin.live_grep, { desc = "Telescope [S]earch Live [G]rep" })
vim.keymap.set("n", "<leader>sG", tel_builtin.grep_string, { desc = "Telescope [S]earch [G]rep String" })
vim.keymap.set("n", "<leader>sb", tel_builtin.buffers, { desc = "Telescope [S]earch [B]uffers" })
vim.keymap.set("n", "<leader>sn", function()
	tel_builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Telescope [S]earch [B]uffers" })

-- Telescope Git
vim.keymap.set("n", "<leader>gc", tel_builtin.git_commits, { desc = "Telescope [G]it [C]ommits" })
vim.keymap.set("n", "<leader>gs", tel_builtin.git_status, { desc = "Telescope [G]it [S]tatus" })
vim.keymap.set("n", "<leader>gS", tel_builtin.git_stash, { desc = "Telescope [G]it [S]tash" })

-- LSP
function K.lsp_keybinds(event)
	local map = function(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end

	map("<leader>lR", vim.lsp.buf.rename, "[L]SP [R]ename Variable")
	map("<leader>la", vim.lsp.buf.code_action, "[L]SP Code Actions", { "n", "x" })
	map("<leader>lr", tel_builtin.lsp_references, "[L]SP [R]eferences")
	map("<leader>li", tel_builtin.lsp_implementations, "[L]SP [I]mplementations")
	map("<leader>ld", tel_builtin.lsp_definitions, "[L]SP [D]efinitions")
	map("<leader>ls", tel_builtin.lsp_document_symbols, "[L]SP Document [S]ymbols")
	map("<leader>lS", tel_builtin.lsp_document_symbols, "[L]SP Workspace [S]ymbols")
	map("<leader>lt", tel_builtin.lsp_type_definitions, "[L]SP [T]ype Definition")
end

-- Conform (Autoformat)
function K.conform_keybinds()
	return {
		"<leader>ff",
		function()
			require("conform").format({
				async = true,
				lsp_format = "fallback",
			})
		end,
		mode = "",
		desc = "[F]ormat [F]ile",
	}
end

return K
