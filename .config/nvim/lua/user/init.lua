-- vim settings
require("user.configs")
require("user.mason")
require("user.neotree")

require("user.pack-a-punch")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

require("user.settings")
