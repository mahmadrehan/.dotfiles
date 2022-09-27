-- vim settings
require("0xahmad.set")
require("0xahmad.configs")
require("0xahmad.pack-a-punch")

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end
