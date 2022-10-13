-- vim settings
require("0xahmad.settings")
require("0xahmad.configs")
require("0xahmad.pack-a-punch")
require("0xahmad.mason")
require("0xahmad.commands")

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
