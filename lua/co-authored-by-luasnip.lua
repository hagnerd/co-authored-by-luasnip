local luasnip = require("luasnip")

local snippet = luasnip.snippet
local format = require("luasnip.extras.fmt").fmt
local insert_node = luasnip.insert_node

local co_authored_by = format("Co-Authored-By: {}", {
  insert_node(1, "Example <example@github.com>")
})

-- TODO: come back and make this the main export
local function setup(options)
  local opts = options or {}
  local trigger = opts.trigger or "cab"

  return luasnip.add_snippets("gitcommit", {
    snippet(
      {
        trig = trigger,
        descr = {'[Co-Authored-By]', 'Support for easily inserting Co-Authored-By: <name> <handle>', 'into gitcommit message bodies'}
      },
      co_authored_by
    )
  })
end

return co_authored_by
