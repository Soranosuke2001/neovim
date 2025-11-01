-- Undotree

local undotree_keybinds = require("config.keybinds").undotree_keybinds

return {
	"mbbill/undotree",
	config = function()
		undotree_keybinds()
	end,
}
