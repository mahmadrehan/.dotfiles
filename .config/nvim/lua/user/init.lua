vim.loader.enable()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim settings
require("user.mason")
require("user.neotree")
require("user.configs")

require("user.pack-a-punch")

if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

require("user.settings")
