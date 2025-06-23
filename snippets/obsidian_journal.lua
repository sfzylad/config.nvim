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

-- Returns a snippet_node wrapped around an insertNode whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, snip, old_state, fmt)
	local fmt = fmt or "[[%Y-%m-%d-%A]]"
	return sn(nil, i(1, os.date(fmt)))
end
local dd = date_input()
local journal_reference = "[[Journal]]"

ls.add_snippets("markdown", {
    s("journal",
        fmt(
            [[
        ---
        tags:
          - daily
          - journal
        created_at: {title}
        type:
          - daily
          - journal
        ---

        <% tp.web.random_picture('1024x768', 'forest and mountains') %>

        ## 📅 Daily Questions
        ##### 🌜 Last night, after work, I...
        - {1}

        ---
        ##### 🙌 One thing I'm excited about right now is...
        - {2}

        ---
        ##### 🚀 One+ thing I plan to accomplish today is...
        - [ ] {3}

        ---
        ##### 👎 One thing I'm struggling with today is...
        - {4}

        ---
        ## Notes
        - {5}

        ---
        ## More notes

        ### Notes created today

        ```dataview
        List FROM "" WHERE file.cday = date("2025-01-06") SORT file.ctime asc
        ```

        ### Notes last touched today
        ```dataview
        List FROM "" WHERE file.mday = date("2025-01-06") SORT file.mtime asc
        ```

        ---
        ## Related
        - {footer}

            ]], {
                title = dd,
                footer = journal_reference,
                i(1, ""),
                i(2, ""),
                i(3, ""),
                i(4, ""),
                i(5, ""),
            }
        )
    ),

})
