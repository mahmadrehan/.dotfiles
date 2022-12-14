-- vim settings
require("user.settings")
require("user.configs")
require("user.mason")

require("user.pack-a-punch")

-- to improve performance
_G.__luacache_config = { modpaths = { enable = false } }
require("impatient")

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end

-- custom commands
local nnoremap = require("user.keymap").nnoremap

nnoremap("<leader>bs", function()
	require("user.custom.browser-search").MenuBrowser()
end)
