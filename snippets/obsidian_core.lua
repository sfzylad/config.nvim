local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local date_input = function(args, snip, old_state, fmt)
	local fmt = fmt or "[[%Y-%m-%d-%A]]"
	return sn(nil, i(1, os.date(fmt)))
end

local dd = date_input()
local footer = "[[INSERT CONNECTION]]"
local info = debug.getinfo(1,'S');

ls.add_snippets("markdown", {
    s("core",
        fmt(
            [[
        ---
        created_at: {date}
        tags:
          - idea
          - to-process
        type:
          - note
        project:
        area:
        ---
       # {1}

        ---
        # Related
        - {footer}

            ]],
            {
                date = dd,
                i(1, "TITLE"),
                footer = footer
            }
        )
    )
})
