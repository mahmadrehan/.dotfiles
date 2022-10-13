local create_cmd = vim.api.nvim_create_user_command
local nnoremap = require("0xahmad.keymap").nnoremap

create_cmd("BrowserSearch", function()
  require("0xahmad.custom.browser-search").MenuBrowser()
end, {})

nnoremap("<leader>bs", ":BrowserSearch<CR>")
