-- Telescope

return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope [S]earch [F]ile" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope [S]earch Live [G]rep" })
		vim.keymap.set("n", "<leader>sG", builtin.grep_string, { desc = "Telescope [S]earch [G]rep String" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope [S]earch [B]uffers" })
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Telescope [S]earch [B]uffers" })

		-- Telescope Git
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope [G]it [C]ommits" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope [G]it [S]tatus" })
		vim.keymap.set("n", "<leader>gS", builtin.git_stash, { desc = "Telescope [G]it [S]tash" })

		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
