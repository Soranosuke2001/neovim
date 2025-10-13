return
-- { -- You can easily change to a different colorscheme.
-- 	-- Change the name of the colorscheme plugin below, and then
-- 	-- change the command in the config to whatever the name of that colorscheme is.
-- 	--
-- 	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000, -- Make sure to load this before all the other start plugins.
-- 	config = function()
-- 		---@diagnostic disable-next-line: missing-fields
-- 		require("tokyonight").setup({
-- 			transparent = true,
-- 			styles = {
-- 				comments = { italic = false }, -- Disable italics in comments
-- 			},
-- 		})
--
-- 		-- Load the colorscheme here.
-- 		-- Like many other themes, this one has different styles, and you could load
-- 		-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }
-- {
-- 	"projekt0n/github-nvim-theme",
-- 	name = "github-theme",
-- 	priority = 1000,
-- 	config = function()
-- 		---@diagnostic disable-next-line: missing-fields
-- 		require("github-theme").setup({
-- 			styles = {
-- 				comments = { italic = false },
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("github_dark_default")
-- 	end,
-- }
-- {
-- 	"gmr458/vscode_modern_theme.nvim",
-- 	name = "vscode-theme",
-- 	priority = 1000,
-- 	config = function()
-- 		---@diagnostic disable-next-line: missing-fields
-- 		require("vscode_modern").setup({
-- 			cursorline = true,
-- 			transparent_background = false,
-- 			nvim_tree_darker = true,
-- 			styles = {
-- 				comments = { italic = false },
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("vscode_modern")
-- 	end,
-- }
{
	"bluz71/vim-moonfly-colors",
	name = "moonfly",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("moonfly")
	end,
}
