local nnoremap = require("user.keymap").nnoremap

nnoremap("<leader>bs", function()
  require("user.custom.browser-search").MenuBrowser()
end)
