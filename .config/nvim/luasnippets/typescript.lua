local ls = require("luasnip")

local s = ls.s
local i = ls.insert_node
local t = ls.text_node

local snippets, autosnippets = {}, {}

table.insert(
	snippets,
	s("eaf", {
		t("export async function "),
		i(1, "fnName"),
		t("("),
		i(2),
		t(") {"),
		t({ "", "    " }),
		i(0, "// body here"),
		t({ "", "}" }),
	})
)

return snippets, autosnippets
