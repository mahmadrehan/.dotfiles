-- vim settings
require("user.settings")
require("user.configs")
require("user.pack-a-punch")
require("user.mason")
require("user.commands")

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
