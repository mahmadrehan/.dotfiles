-- vim settings
require("0xahmad.conf.settings")
require("0xahmad.conf.configs")
require("0xahmad.conf.remaps")

-- for initting packer require("0xahmad.pack-a-punch")

require("0xahmad.visuals")

-- other setup
require("0xahmad.telescope")
require("0xahmad.completionist")
require("0xahmad.tab9")
require("0xahmad.lsp")
require("0xahmad.snippies")

-- **when** you finally decide to do this that is.........
-- require('0xaf2f6ad.debugger')

-- other configs
require("0xahmad.more_configs.bufferline")
require("0xahmad.more_configs.commenting")
require("0xahmad.more_configs.treesitter")
require("0xahmad.more_configs.treesitter-context")
require("0xahmad.more_configs.neotree")
require("0xahmad.more_configs.misc-setups")

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end
