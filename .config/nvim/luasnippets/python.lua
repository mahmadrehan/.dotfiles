local ls = require("luasnip")

local s = ls.s

local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

-- Snippets --

-- watch teej's video on "kool" tricks on how to setup far more sick
-- snippets, it'll take 10-20 mins max trust me it'll be worth it

table.insert(snippets, s("wth", { t("Du bist ein Bully Maguire") }))

return snippets, autosnippets
