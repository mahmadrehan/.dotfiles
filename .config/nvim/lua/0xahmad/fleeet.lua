--local Color, colors, Group, groups, styles = require("colorbuddy").setup()

local Color, c, Group, g, s = require("colorbuddy").setup()
local b = s.bold
local i = s.italic
local n = s.inverse
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local sto = s.standout
local no = s.NONE
local v = vim

local italics = (function()
	if vim.g.onebuddy_disable_italics ~= true then
		return i
	else
		return no
	end
end)()

-- Ma theme naw bisssh haha, no actually very much thanks for this :^)
v.g.colors_name = "fleeet"

-------------------------
-- Vim Primary Colors --
-------------------------
Color.new("Red", "#D04779")
Color.new("DarkRed", "#B8406B")
Color.new("Blue", "#55A3E4")
Color.new("DarkBlue", "#207FCF")
Color.new("Green", "#40CBAB")
Color.new("DarkGreen", "#418778")
Color.new("Orange", "#EFB080")
Color.new("DarkOrange", "#C68554")
Color.new("Yellow", "#FAD075")
Color.new("DarkYellow", "#E1B147")
Color.new("Purple", "#A855F7")
Color.new("Violet", "#7D5BDE")
Color.new("Magenta", "#CE5DC3")
Color.new("DarkMagenta", "#995292")
Color.new("Black", "#111111")
Color.new("Grey", "#313941")
Color.new("White", "#ededed")
Color.new("Cyan", "#8abeb7")
Color.new("DarkCyan", "#80a0ff")
Color.new("Aqua", "#8ec07c")
Color.new("pink", "#CE5DC3")

-------------------------
-- Vim Terminal Colors --
-------------------------

v.g.terminal_color_0 = "#111111"
v.g.terminal_color_8 = "#111111"
v.g.terminal_color_1 = "#B8406B"
v.g.terminal_color_9 = "#B8406B"
v.g.terminal_color_2 = "#5ED091"
v.g.terminal_color_10 = "#5ED091"
v.g.terminal_color_3 = "#EFB080"
v.g.terminal_color_11 = "#EFB080"
v.g.terminal_color_4 = "#55A3E4"
v.g.terminal_color_12 = "#55A3E4"
v.g.terminal_color_5 = "#7D5BDE"
v.g.terminal_color_13 = "#7D5BDE"
v.g.terminal_color_6 = "#40CBAB"
v.g.terminal_color_14 = "#40CBAB"
v.g.terminal_color_7 = "#e3e5e9"
v.g.terminal_color_15 = "#e3e5e9"

-- COLOR SCHEME

Color.new("lightGray", "#abb2bf")
Color.new("gray", "#828997")
Color.new("darkGray", "#5c6370")
Color.new("vDarkGray", "#4b5263")
Color.new("bluePrimary", "#55a3e4")
Color.new("purplePrimary", "#7A6FDD")
Color.new("greenPrimary", "#40CBAB")
Color.new("greenPrimary2", "#40CBAB")
Color.new("pinkPrimary", "#CE5DC3")
Color.new("hue_5_3", "#D04779")

Color.new("errorLight", "#D04779")
Color.new("errorDark", "#B8406B")

Color.new("hue_5", "#EFB080")
Color.new("hue_6", "#EFB080")
Color.new("hue_6_2", "#EFB080")
Color.new("syntax_bg", "#282c34")
Color.new("syntax_gutter", "#636d83")
Color.new("syntax_cursor", "#2c323c")
Color.new("syntax_accent", "#40CBAB")
Color.new("vertsplit", "#181a1f")
Color.new("special_grey", "#3b4048")
Color.new("visual_grey", "#3e4452")
Color.new("pmenu", "#333841")

-- Python
Group.new("pythonImport", c.greenPrimary, c.none, no)
Group.new("pythonBuiltin", c.hue_5_3, c.none, no)
Group.new("pythonStatement", c.greenPrimary, c.none, no)
Group.new("pythonParam", c.hue_6, c.none, no)
Group.new("pythonEscape", c.hue_5, c.none, no)
Group.new("pythonSelf", c.gray, c.none, italics)
Group.new("pythonName", c.purplePrimary, c.none, no)
Group.new("pythonOperator", c.purplePrimary, c.none, no)
Group.new("pythonEscape", c.hue_5, c.none, no)
Group.new("pythonFunction", c.lightGray, c.none, no)
Group.new("pythonDecorator", c.hue_5, c.none, no)
Group.new("pythonKeyword", c.bluePrimary, c.none, no)
Group.new("pythonModule", c.greenPrimary, c.none, no)
Group.new("pythonStringDelimiter", c.hue_5_3, c.none, no)
Group.new("pythonSymbol", c.greenPrimary, c.none, no)

----------------------
-- Vim Editor Color --
----------------------

Group.new("Normal", c.lightGray, c.syntax_bg, no)
Group.new("bold", c.none, c.none, b)
Group.new("ColorColumn", c.none, c.syntax_cursor, no)
Group.new("Conceal", c.vDarkGray, c.syntax_bg, no)
Group.new("Cursor", c.none, c.syntax_accent, no)
Group.new("CursorIM", c.none, c.none, no)
Group.new("CursorColumn", c.none, c.syntax_cursor, no)
Group.new("CursorLine", c.none, c.syntax_cursor, no)
Group.new("Directory", c.bluePrimary, c.none, no)
Group.new("ErrorMsg", c.hue_5, c.none, no)
Group.new("VertSplit", c.vDarkGray, c.none, no)
Group.new("Folded", c.darkGray, c.none, no)
Group.new("FoldColumn", c.darkGray, c.syntax_cursor, no)
Group.new("IncSearch", c.syntax_bg, c.purplePrimary, no)
Group.new("LineNr", c.vDarkGray, c.none, no)
Group.new("CursorLineNr", c.lightGray, c.syntax_cursor, no)
Group.new("MatchParen", c.hue_5, c.syntax_cursor, ul + b)
Group.new("Italic", c.none, c.none, italics)
Group.new("ModeMsg", c.lightGray, c.none, no)
Group.new("MoreMsg", c.lightGray, c.none, no)
Group.new("NonText", c.darkGray, c.none, no)
Group.new("PMenu", c.none, c.pmenu, no)
Group.new("PMenuSel", c.none, c.vDarkGray, no)
Group.new("PMenuSbar", c.none, c.darkGray, no)
Group.new("PMenuThumb", c.none, c.lightGray, no)
Group.new("Question", c.bluePrimary, c.none, no)
Group.new("Search", c.darkGray, c.hue_6_2, no)
Group.new("SpecialKey", c.special_grey, c.none, no)
Group.new("Whitespace", c.special_grey, c.none, no)
Group.new("StatusLine", c.lightGray, c.vDarkGray, no)
Group.new("StatusLineNC", c.darkGray, c.none, no)
Group.new("TabLine", c.gray, c.visual_grey, no)
Group.new("TabLineFill", c.darkGray, c.visual_grey, no)
Group.new("TabLineSel", c.darkGray, c.bluePrimary, no)
Group.new("Title", c.lightGray, c.none, b)
Group.new("Visual", c.none, c.visual_grey, no)
Group.new("VisualNOS", c.none, c.visual_grey, no)
Group.new("WarningMsg", c.hue_5, c.none, no)
Group.new("TooLong", c.hue_5, c.none, no)
Group.new("WildMenu", c.lightGray, c.darkGray, no)
Group.new("SignColumn", c.none, c.none, no)
Group.new("Special", c.bluePrimary, c.none, no)

---------------------------
-- Vim Help Highlighting --
---------------------------

Group.new("helpCommand", c.hue_6_2, c.none, no)
Group.new("helpExample", c.hue_6_2, c.none, no)
Group.new("helpHeader", c.lightGray, c.none, b)
Group.new("helpSectionDelim", c.darkGray, c.none, no)

----------------------------------
-- Standard Syntax Highlighting --
----------------------------------

Group.new("Comment", c.darkGray, c.none, italics)
Group.new("Constant", c.greenPrimary2, c.none, no)
Group.new("String", c.pinkPrimary, c.none, no)
Group.new("Character", c.pinkPrimary, c.none, no)
Group.new("Number", c.hue_6, c.none, no)
Group.new("Boolean", c.hue_6, c.none, no)
Group.new("Float", c.hue_6, c.none, no)
Group.new("Identifier", c.hue_5, c.none, no)
Group.new("Function", c.bluePrimary, c.none, no)
Group.new("Statement", c.purplePrimary, c.none, no)
Group.new("Conditional", c.purplePrimary, c.none, no)
Group.new("Repeat", c.purplePrimary, c.none, no)
Group.new("Label", c.purplePrimary, c.none, no)
Group.new("Operator", c.syntax_accent, c.none, no)
Group.new("Keyword", c.hue_5, c.none, no)
Group.new("Exception", c.purplePrimary, c.none, no)
Group.new("PreProc", c.hue_6_2, c.none, no)
Group.new("Include", c.bluePrimary, c.none, no)
Group.new("Define", c.purplePrimary, c.none, no)
Group.new("Macro", c.purplePrimary, c.none, no)
Group.new("PreCondit", c.hue_6_2, c.none, no)
Group.new("Type", c.hue_6_2, c.none, no)
Group.new("StorageClass", c.hue_6_2, c.none, no)
Group.new("Structure", c.hue_6_2, c.none, no)
Group.new("Typedef", c.hue_6_2, c.none, no)
Group.new("Special", c.bluePrimary, c.none, no)
Group.new("SpecialChar", c.none, c.none, no)
Group.new("Tag", c.none, c.none, no)
Group.new("Delimiter", c.none, c.none, no)
Group.new("SpecialComment", c.none, c.none, no)
Group.new("Debug", c.none, c.none, no)
Group.new("Underlined", c.none, c.none, ul)
Group.new("Ignore", c.none, c.none, no)
Group.new("Error", c.hue_5, c.darkGray, b)
Group.new("Todo", c.purplePrimary, c.darkGray, no)

-----------------------
-- Diff Highlighting --
-----------------------

Group.new("DiffAdd", c.greenPrimary2, c.visual_grey, no)
Group.new("DiffChange", c.hue_6, c.visual_grey, no)
Group.new("DiffDelete", c.hue_5, c.visual_grey, no)
Group.new("DiffText", c.bluePrimary, c.visual_grey, no)
Group.new("DiffAdded", c.greenPrimary2, c.visual_grey, no)
Group.new("DiffFile", c.hue_5, c.visual_grey, no)
Group.new("DiffNewFile", c.greenPrimary2, c.visual_grey, no)
Group.new("DiffLine", c.bluePrimary, c.visual_grey, no)
Group.new("DiffRemoved", c.hue_5, c.visual_grey, no)

---------------------------
-- Filetype Highlighting --
---------------------------

-- Asciidoc
Group.new("asciidocListingBlock", c.gray, c.none, no)

-- C/C++ highlighting
Group.new("cInclude", c.purplePrimary, c.none, no)
Group.new("cPreCondit", c.purplePrimary, c.none, no)
Group.new("cPreConditMatch", c.purplePrimary, c.none, no)
Group.new("cType", c.purplePrimary, c.none, no)
Group.new("cStorageClass", c.purplePrimary, c.none, no)
Group.new("cStructure", c.purplePrimary, c.none, no)
Group.new("cOperator", c.purplePrimary, c.none, no)
Group.new("cStatement", c.purplePrimary, c.none, no)
Group.new("cTODO", c.purplePrimary, c.none, no)
Group.new("cConstant", c.hue_6, c.none, no)
Group.new("cSpecial", c.greenPrimary, c.none, no)
Group.new("cSpecialCharacter", c.greenPrimary, c.none, no)
Group.new("cString", c.pinkPrimary, c.none, no)
Group.new("cppType", c.purplePrimary, c.none, no)
Group.new("cppStorageClass", c.purplePrimary, c.none, no)
Group.new("cppStructure", c.purplePrimary, c.none, no)
Group.new("cppModifier", c.purplePrimary, c.none, no)
Group.new("cppOperator", c.purplePrimary, c.none, no)
Group.new("cppAccess", c.purplePrimary, c.none, no)
Group.new("cppStatement", c.purplePrimary, c.none, no)
Group.new("cppConstant", c.hue_5, c.none, no)
Group.new("cCppString", c.pinkPrimary, c.none, no)

-- Cucumber
Group.new("cucumberGiven", c.bluePrimary, c.none, no)
Group.new("cucumberWhen", c.bluePrimary, c.none, no)
Group.new("cucumberWhenAnd", c.bluePrimary, c.none, no)
Group.new("cucumberThen", c.bluePrimary, c.none, no)
Group.new("cucumberThenAnd", c.bluePrimary, c.none, no)
Group.new("cucumberUnparsed", c.hue_6, c.none, no)
Group.new("cucumberFeature", c.hue_5, c.none, b)
Group.new("cucumberBackground", c.purplePrimary, c.none, b)
Group.new("cucumberScenario", c.purplePrimary, c.none, b)
Group.new("cucumberScenarioOutline", c.purplePrimary, c.none, b)
Group.new("cucumberTags", c.darkGray, c.none, b)
Group.new("cucumberDelimiter", c.darkGray, c.none, b)

-- CSS/Sass
Group.new("cssAttrComma", c.purplePrimary, c.none, no)
Group.new("cssAttributeSelector", c.greenPrimary2, c.none, no)
Group.new("cssBraces", c.gray, c.none, no)
Group.new("cssClassName", c.hue_6, c.none, no)
Group.new("cssClassNameDot", c.hue_6, c.none, no)
Group.new("cssDefinition", c.purplePrimary, c.none, no)
Group.new("cssFontAttr", c.hue_6, c.none, no)
Group.new("cssFontDescriptor", c.purplePrimary, c.none, no)
Group.new("cssFunctionName", c.bluePrimary, c.none, no)
Group.new("cssIdentifier", c.bluePrimary, c.none, no)
Group.new("cssImportant", c.purplePrimary, c.none, no)
Group.new("cssInclude", c.lightGray, c.none, no)
Group.new("cssIncludeKeyword", c.purplePrimary, c.none, no)
Group.new("cssMediaType", c.hue_6, c.none, no)
Group.new("cssProp", c.greenPrimary, c.none, no)
Group.new("cssPseudoClassId", c.hue_6, c.none, no)
Group.new("cssSelectorOp", c.purplePrimary, c.none, no)
Group.new("cssSelectorOp2", c.purplePrimary, c.none, no)
Group.new("cssStringQ", c.pinkPrimary, c.none, no)
Group.new("cssStringQQ", c.pinkPrimary, c.none, no)
Group.new("cssTagName", c.hue_5, c.none, no)
Group.new("cssAttr", c.hue_6, c.none, no)
Group.new("sassAmpersand", c.hue_5, c.none, no)
Group.new("sassClass", c.hue_6_2, c.none, no)
Group.new("sassControl", c.purplePrimary, c.none, no)
Group.new("sassExtend", c.purplePrimary, c.none, no)
Group.new("sassFor", c.lightGray, c.none, no)
Group.new("sassProperty", c.greenPrimary, c.none, no)
Group.new("sassFunction", c.greenPrimary, c.none, no)
Group.new("sassId", c.bluePrimary, c.none, no)
Group.new("sassInclude", c.purplePrimary, c.none, no)
Group.new("sassMedia", c.purplePrimary, c.none, no)
Group.new("sassMediaOperators", c.lightGray, c.none, no)
Group.new("sassMixin", c.purplePrimary, c.none, no)
Group.new("sassMixinName", c.bluePrimary, c.none, no)
Group.new("sassMixing", c.purplePrimary, c.none, no)
Group.new("scssSelectorName", c.hue_6_2, c.none, no)

-- Git and git related plugins
Group.new("gitcommitComment", c.darkGray, c.none, no)
Group.new("gitcommitUnmerged", c.greenPrimary2, c.none, no)
Group.new("gitcommitOnBranch", c.none, c.none, no)
Group.new("gitcommitBranch", c.purplePrimary, c.none, no)
Group.new("gitcommitDiscardedType", c.hue_5, c.none, no)
Group.new("gitcommitSelectedType", c.greenPrimary2, c.none, no)
Group.new("gitcommitHeader", c.none, c.none, no)
Group.new("gitcommitUntrackedFile", c.greenPrimary, c.none, no)
Group.new("gitcommitDiscardedFile", c.hue_5, c.none, no)
Group.new("gitcommitSelectedFile", c.greenPrimary2, c.none, no)
Group.new("gitcommitUnmergedFile", c.hue_6_2, c.none, no)
Group.new("gitcommitFile", c.none, c.none, no)
Group.new("gitcommitNoBranch", g.gitcommitBranch, g.gitcommitBranch, g.gitcommitBranch)
Group.new("gitcommitUntracked", g.gitcommitComment, g.gitcommitComment, g.gitcommitComment)
Group.new("gitcommitDiscarded", g.gitcommitComment, g.gitcommitComment, g.gitcommitComment)
Group.new("gitcommitDiscardedArrow", g.gitcommitDiscardedFile, g.gitcommitDiscardedFile, g.gitcommitDiscardedFile)
Group.new("gitcommitSelectedArrow", g.gitcommitSelectedFile, g.gitcommitSelectedFile, g.gitcommitSelectedFile)
Group.new("gitcommitUnmergedArrow", g.gitcommitUnmergedFile, g.gitcommitUnmergedFile, g.gitcommitUnmergedFile)
Group.new("SignifySignAdd", c.greenPrimary2, c.none, no)
Group.new("SignifySignChange", c.hue_6_2, c.none, no)
Group.new("SignifySignDelete", c.hue_5, c.none, no)
Group.new("GitGutterAdd", g.SignifySignAdd, g.SignifySignAdd, g.SignifySignAdd)
Group.new("GitGutterChange", g.SignifySignChange, g.SignifySignChange, g.SignifySignChange)
Group.new("GitGutterDelete", g.SignifySignDelete, g.SignifySignDelete, g.SignifySignDelete)
Group.new("diffAdded", c.greenPrimary2, c.none, no)
Group.new("diffRemoved", c.hue_5, c.none, no)

-- Go
Group.new("goDeclaration", c.purplePrimary, c.none, no)
Group.new("goField", c.hue_5, c.none, no)
Group.new("goMethod", c.greenPrimary, c.none, no)
Group.new("goType", c.purplePrimary, c.none, no)
Group.new("goUnsignedInts", c.greenPrimary, c.none, no)

-- HTML
Group.new("htmlArg", c.hue_6, c.none, no)
Group.new("htmlTagName", c.hue_5, c.none, no)
Group.new("htmlTagN", c.hue_5, c.none, no)
Group.new("htmlSpecialTagName", c.hue_5, c.none, no)
Group.new("htmlTag", c.gray, c.none, no)
Group.new("htmlEndTag", c.gray, c.none, no)
Group.new("MatchTag", c.hue_5, c.syntax_cursor, ul + b)

-- JavaScript
Group.new("coffeeString", c.pinkPrimary, c.none, no)
Group.new("javaScriptBraces", c.gray, c.none, no)
Group.new("javaScriptFunction", c.purplePrimary, c.none, no)
Group.new("javaScriptIdentifier", c.purplePrimary, c.none, no)
Group.new("javaScriptNull", c.hue_6, c.none, no)
Group.new("javaScriptNumber", c.hue_6, c.none, no)
Group.new("javaScriptRequire", c.greenPrimary, c.none, no)
Group.new("javaScriptReserved", c.purplePrimary, c.none, no)
-- httpc.//github.com/pangloss/vim-javascript
Group.new("jsArrowFunction", c.purplePrimary, c.none, no)
Group.new("jsBraces", c.gray, c.none, no)
Group.new("jsClassBraces", c.gray, c.none, no)
Group.new("jsClassKeywords", c.purplePrimary, c.none, no)
Group.new("jsDocParam", c.bluePrimary, c.none, no)
Group.new("jsDocTags", c.purplePrimary, c.none, no)
Group.new("jsFuncBraces", c.gray, c.none, no)
Group.new("jsFuncCall", c.bluePrimary, c.none, no)
Group.new("jsFuncParens", c.gray, c.none, no)
Group.new("jsFunction", c.purplePrimary, c.none, no)
Group.new("jsGlobalObjects", c.hue_6_2, c.none, no)
Group.new("jsModuleWords", c.purplePrimary, c.none, no)
Group.new("jsModules", c.purplePrimary, c.none, no)
Group.new("jsNoise", c.gray, c.none, no)
Group.new("jsNull", c.hue_6, c.none, no)
Group.new("jsOperator", c.purplePrimary, c.none, no)
Group.new("jsParens", c.gray, c.none, no)
Group.new("jsStorageClass", c.purplePrimary, c.none, no)
Group.new("jsTemplateBraces", c.pinkPrimary, c.none, no)
Group.new("jsTemplateVar", c.greenPrimary2, c.none, no)
Group.new("jsThis", c.hue_5, c.none, no)
Group.new("jsUndefined", c.hue_6, c.none, no)
Group.new("jsObjectValue", c.bluePrimary, c.none, no)
Group.new("jsObjectKey", c.greenPrimary, c.none, no)
Group.new("jsReturn", c.purplePrimary, c.none, no)
-- httpc.//github.com/othree/yajs.vim
Group.new("javascriptArrowFunc", c.purplePrimary, c.none, no)
Group.new("javascriptClassExtends", c.purplePrimary, c.none, no)
Group.new("javascriptClassKeyword", c.purplePrimary, c.none, no)
Group.new("javascriptDocNotation", c.purplePrimary, c.none, no)
Group.new("javascriptDocParamName", c.bluePrimary, c.none, no)
Group.new("javascriptDocTags", c.purplePrimary, c.none, no)
Group.new("javascriptEndColons", c.darkGray, c.none, no)
Group.new("javascriptExport", c.purplePrimary, c.none, no)
Group.new("javascriptFuncArg", c.lightGray, c.none, no)
Group.new("javascriptFuncKeyword", c.purplePrimary, c.none, no)
Group.new("javascriptIdentifier", c.hue_5, c.none, no)
Group.new("javascriptImport", c.purplePrimary, c.none, no)
Group.new("javascriptObjectLabel", c.lightGray, c.none, no)
Group.new("javascriptOpSymbol", c.greenPrimary, c.none, no)
Group.new("javascriptOpSymbols", c.greenPrimary, c.none, no)
Group.new("javascriptPropertyName", c.greenPrimary2, c.none, no)
Group.new("javascriptTemplateSB", c.pinkPrimary, c.none, no)
Group.new("javascriptVariable", c.purplePrimary, c.none, no)

-- JSON
Group.new("jsonCommentError", c.lightGray, c.none, no)
Group.new("jsonKeyword", c.hue_5, c.none, no)
Group.new("jsonQuote", c.darkGray, c.none, no)
Group.new("jsonTrailingCommaError", c.hue_5, c.none, r)
Group.new("jsonMissingCommaError", c.hue_5, c.none, r)
Group.new("jsonNoQuotesError", c.hue_5, c.none, r)
Group.new("jsonNumError", c.hue_5, c.none, r)
Group.new("jsonString", c.pinkPrimary, c.none, no)
Group.new("jsonBoolean", c.purplePrimary, c.none, no)
Group.new("jsonNumber", c.hue_6, c.none, no)
Group.new("jsonStringSQError", c.hue_5, c.none, r)
Group.new("jsonSemicolonError", c.hue_5, c.none, r)

-- Markdown
Group.new("markdownUrl", c.darkGray, c.none, no)
Group.new("markdownBold", c.hue_6, c.none, b)
Group.new("markdownItalic", c.hue_6, c.none, b)
Group.new("markdownCode", c.pinkPrimary, c.none, no)
Group.new("markdownCodeBlock", c.hue_5, c.none, no)
Group.new("markdownCodeDelimiter", c.greenPrimary2, c.none, no)
Group.new("markdownHeadingDelimiter", c.pinkPrimary, c.none, no)
Group.new("markdownH1", c.hue_5, c.none, no)
Group.new("markdownH2", c.hue_5, c.none, no)
Group.new("markdownH3", c.hue_5, c.none, no)
Group.new("markdownH3", c.hue_5, c.none, no)
Group.new("markdownH4", c.hue_5, c.none, no)
Group.new("markdownH5", c.hue_5, c.none, no)
Group.new("markdownH6", c.hue_5, c.none, no)
Group.new("markdownListMarker", c.hue_5, c.none, no)

-- PHP
Group.new("phpClass", c.hue_6_2, c.none, no)
Group.new("phpFunction", c.bluePrimary, c.none, no)
Group.new("phpFunctions", c.bluePrimary, c.none, no)
Group.new("phpInclude", c.purplePrimary, c.none, no)
Group.new("phpKeyword", c.purplePrimary, c.none, no)
Group.new("phpParent", c.darkGray, c.none, no)
Group.new("phpType", c.purplePrimary, c.none, no)
Group.new("phpSuperGlobals", c.hue_5, c.none, no)

-- Spelling
Group.new("SpellBad", c.darkGray, c.none, uc)
Group.new("SpellLocal", c.darkGray, c.none, uc)
Group.new("SpellCap", c.darkGray, c.none, uc)
Group.new("SpellRare", c.darkGray, c.none, uc)

-- Vim
Group.new("vimCommand", c.purplePrimary, c.none, no)
Group.new("vimCommentTitle", c.darkGray, c.none, b)
Group.new("vimFunction", c.greenPrimary, c.none, no)
Group.new("vimFuncName", c.purplePrimary, c.none, no)
Group.new("vimHighlight", c.bluePrimary, c.none, no)
Group.new("vimLineComment", c.darkGray, c.none, italics)
Group.new("vimParenSep", c.gray, c.none, no)
Group.new("vimSep", c.gray, c.none, no)
Group.new("vimUserFunc", c.greenPrimary, c.none, no)
Group.new("vimVar", c.hue_5, c.none, no)

-- XML
Group.new("xmlAttrib", c.hue_6_2, c.none, no)
Group.new("xmlEndTag", c.hue_5, c.none, no)
Group.new("xmlTag", c.hue_5, c.none, no)
Group.new("xmlTagName", c.hue_5, c.none, no)

-- ZSH
Group.new("zshCommands", c.lightGray, c.none, no)
Group.new("zshDeref", c.hue_5, c.none, no)
Group.new("zshShortDeref", c.hue_5, c.none, no)
Group.new("zshFunction", c.greenPrimary, c.none, no)
Group.new("zshKeyword", c.purplePrimary, c.none, no)
Group.new("zshSubst", c.hue_5, c.none, no)
Group.new("zshSubstDelim", c.darkGray, c.none, no)
Group.new("zshTypes", c.purplePrimary, c.none, no)
Group.new("zshVariableDef", c.hue_6, c.none, no)

-- Rust
Group.new("rustExternCrate", c.hue_5, c.none, b)
Group.new("rustIdentifier", c.bluePrimary, c.none, no)
Group.new("rustDeriveTrait", c.greenPrimary2, c.none, no)
Group.new("SpecialComment", c.darkGray, c.none, no)
Group.new("rustCommentLine", c.darkGray, c.none, no)
Group.new("rustCommentLineDoc", c.darkGray, c.none, no)
Group.new("rustCommentLineDocError", c.darkGray, c.none, no)
Group.new("rustCommentBlock", c.darkGray, c.none, no)
Group.new("rustCommentBlockDoc", c.darkGray, c.none, no)
Group.new("rustCommentBlockDocError", c.darkGray, c.none, no)

-- Man
Group.new("manTitle", g.String, g.String, g.String)
Group.new("manFooter", c.darkGray, c.none, no)

-------------------------
-- Plugin Highlighting --
-------------------------

-- ALE (Asynchronous Lint Engine)
Group.new("ALEWarningSign", c.hue_6_2, c.none, no)
Group.new("ALEErrorSign", c.hue_5, c.none, no)

-- Neovim NERDTree Background fix
Group.new("NERDTreeFile", c.lightGray, c.none, no)

-----------------------------
--     LSP Highlighting    --
-----------------------------
Group.new("LspDiagnosticsDefaultError", c.hue_5, c.none, no)
Group.new("LspDiagnosticsDefaultWarning", c.hue_6_2, c.none, no)
Group.new("LspDiagnosticsDefaultInformation", c.greenPrimary, c.none, no)
Group.new("LspDiagnosticsDefaultHint", c.greenPrimary2, c.none, no)
Group.new("LspDiagnosticsVirtualTextError", c.hue_5, c.none, no)
Group.new("LspDiagnosticsVirtualTextWarning", c.hue_6_2, c.none, no)
Group.new("LspDiagnosticsVirtualTextInformation", c.greenPrimary, c.none, no)
Group.new("LspDiagnosticsVirtualTextHint", c.greenPrimary2, c.none, no)
Group.new("LspDiagnosticsUnderlineError", c.hue_5, c.none, ul)
Group.new("LspDiagnosticsUnderlineWarning", c.hue_6_2, c.none, ul)
Group.new("LspDiagnosticsUnderlineInformation", c.greenPrimary, c.none, ul)
Group.new("LspDiagnosticsUnderlineHint", c.greenPrimary2, c.none, ul)
Group.new("LspDiagnosticsFloatingError", c.hue_5, g.pmenu, ul)
Group.new("LspDiagnosticsFloatingWarning", c.hue_6_2, g.pmenu, ul)
Group.new("LspDiagnosticsFloatingInformation", c.greenPrimary, g.pmenu, ul)
Group.new("LspDiagnosticsFloatingHint", c.greenPrimary2, g.pmenu, ul)
Group.new("LspDiagnosticsSignError", c.hue_5, c.none, no)
Group.new("LspDiagnosticsSignWarning", c.hue_6_2, c.none, no)
Group.new("LspDiagnosticsSignInformation", c.greenPrimary, c.none, no)
Group.new("LspDiagnosticsSignHint", c.greenPrimary2, c.none, no)
-----------------------------
-- TreeSitter Highlighting --
-----------------------------
Group.new("TSAnnotation", c.hue_6_2, c.none, no)
Group.new("TSAttribute", c.greenPrimary, c.none, no)
Group.new("TSBoolean", c.hue_6, c.none, no)
Group.new("TSCharacter", c.greenPrimary2, c.none, no)
Group.new("TSConditional", c.pink, c.none, no)
Group.new("TSConstant", c.bluePrimary, c.none, no)
Group.new("TSConstBuiltin", c.hue_6, c.none, no)
Group.new("TSConstMacro", c.greenPrimary, c.none, no)
Group.new("TSConstructor", c.greenPrimary, c.none, no)
Group.new("TSEmphasis", c.hue_6_2, c.none, no)
Group.new("TSError", c.hue_5, c.none, no)
Group.new("TSException", c.pink, c.none, no)
Group.new("TSField", c.hue_5, c.none, no)
Group.new("TSFloat", c.greenPrimary2, c.none, no)
Group.new("TSFunction", c.bluePrimary, c.none, no)
Group.new("TSFuncBuiltin", c.bluePrimary, c.none, no)
Group.new("TSFuncMacro", c.hue_6_2, c.none, no)
Group.new("TSInclude", c.pink, c.none, no)
Group.new("TSKeyword", c.pink, c.none, no)
Group.new("TSKeywordFunction", c.pink, c.none, no)
Group.new("TSKeywordOperator", c.pink, c.none, no)
Group.new("TSLabel", c.bluePrimary, c.none, no)
Group.new("TSLiteral", c.hue_6_2, c.none, no)
Group.new("TSMethod", c.bluePrimary, c.none, no)
Group.new("TSNamespace", c.pink, c.none, no)
Group.new("TSNumber", c.hue_6, c.none, no)
Group.new("TSOperator", c.lightGray, c.none, no)
Group.new("TSParameter", c.greenPrimary, c.none, no)
Group.new("TSParameterReference", c.greenPrimary, c.none, no)
Group.new("TSProperty", c.hue_6_2, c.none, no)
Group.new("TSPunctBracket", c.lightGray, c.none, no)
Group.new("TSPunctDelimiter", c.lightGray, c.none, no)
Group.new("TSPunctSpecial", c.lightGray, c.none, no)
Group.new("TSRepeat", c.pink, c.none, no)
Group.new("TSString", c.pinkPrimary, c.none, no)
Group.new("TSStringEscape", c.greenPrimary, c.none, no)
Group.new("TSStringRegex", c.purplePrimary, c.none, no)
Group.new("TSStrong", c.hue_6_2, c.none, no)
Group.new("TSStructure", c.hue_6_2, c.none, no)
Group.new("TSTag", c.hue_5, c.none, no)
Group.new("TSTagDelimiter", c.darkGray, c.none, no)
Group.new("TSText", c.hue_6_2, c.none, no)
Group.new("TSTitle", c.hue_6_2, c.none, no)
Group.new("TSType", c.bluePrimary, c.none, no)
Group.new("TSTypeBuiltin", c.bluePrimary, c.none, no)
Group.new("TSUnderline", c.hue_6_2, c.none, no)
Group.new("TSURI", c.hue_6_2, c.none, no)
Group.new("TSVariable", c.greenPrimary, c.none, no)
Group.new("TSVariableBuiltin", c.hue_6_2, c.none, no)
