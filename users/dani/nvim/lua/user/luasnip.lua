local ls_status_ok, ls = pcall(require, "luasnip")
if not ls_status_ok then
    return
end

-- shorcut to source my luasnips file again, which will reload my snippets
--vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
vim.api.nvim_set_keymap("n", "<leader><leader>s", "<cmd>source ~/.dotfiles/nvim/.config/nvim/lua/dani/luasnip.lua<CR>", {})

local types = require "luasnip.util.types"
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = false,

  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "<-", "Error" } },
      },
    },
  },
}

ls.snippets = {
    all = {
    },
    lua = {
        -- Lua specific snippets go here.
        ls.parser.parse_snippet("lf", "local $1 = function($2)\n  $0\nend"),
        s("req", fmt("local {} = require('{}')", { i(1, "default"), rep(1) })),
    },
    go = {
        ls.parser.parse_snippet("f", "func $1($2) ($3, error) {\n  \n}$0\n"),
        --ls.parser.parse_snippet("iferr", "if err != nil {\n  \n}$0\n"),
        s("fc", fmt("{}, err := {}()\nif err != nil {{ \n\treturn fmt.Errorf(\"unable to {}: %w\", err)\n}}", { i(1, "myVar"), i(2, "myFunc"), i(3, "_____") })),
        s("iferr", fmt("if err != nil {{ \n\treturn fmt.Errorf(\"unable to {}: %w\", err)\n}}", { i(1, "_____"), })),
        s(
            "tdt",
            fmt(
            [[
            func TestYoFunction(t *testing.T) {{
                testCases := []struct{{
                    desc string
                }}{{
                    {{
                        desc: "",
                    }},
                }}
                for _, tc := range testCases {{
                    t.Run(tc.desc, func(t *testing.T) {{
                        
                    }})
                }}
            }}
            ]],
            {})),
        s(
            "dbtx",
            fmt(
            [[
            func HideYoWifeHideYoKids() {{
                return
            }}
            ]],
            {
            }
            )
        ),
    },
}




-- requires neovim 0.7+

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
--vim.keymap.set({ "i", "s" }, "<c-k>", function()
  --if ls.expand_or_jumpable() then
    --ls.expand_or_jump()
  --end
--end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
--vim.keymap.set({ "i", "s" }, "<c-j>", function()
  --if ls.jumpable(-1) then
    --ls.jump(-1)
  --end
--end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
--vim.keymap.set("i", "<c-l>", function()
  --if ls.choice_active() then
    --ls.change_choice(1)
  --end
--end)
