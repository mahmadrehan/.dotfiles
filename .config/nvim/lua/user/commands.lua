local create_cmd = vim.api.nvim_create_user_command
local nnoremap = require("user.keymap").nnoremap

create_cmd("BrowserSearch", function()
  require("user.custom.browser-search").MenuBrowser()
end, {})

nnoremap("<leader>bs", ":BrowserSearch<CR>")
