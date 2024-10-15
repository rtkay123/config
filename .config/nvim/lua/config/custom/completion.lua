local kind_icons = {
  Text = "  ",
  Method = "  ",
  Function = "  ",
  Constructor = "  ",
  Field = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = "  ",
  Property = "  ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = "  ",
  Color = "  ",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Event = "  ",
  Operator = "  ",
  TypeParameter = "  ",
}

local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local blackOrWhiteFg = function(r, g, b)
  return ((r * 0.299 + g * 0.587 + b * 0.114) > 186) and "#000000" or "#ffffff"
end

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      if vim_item.kind == "Color" and entry.completion_item.documentation then
        local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
        if r then
          local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
          local group = "Tw_" .. color
          if vim.fn.hlID(group) < 1 then
            vim.api.nvim_set_hl(0, group, { fg = blackOrWhiteFg(r, g, b), bg = "#" .. color })
          end
          vim_item.kind = " " .. kind_icons[vim_item.kind] .. " "
          vim_item.kind_hl_group = group
          return vim_item
        end
      end
      -- -- Kind icons
      -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
      -- -- Source
       vim_item.menu = ({
         buffer = "",
         nvim_lsp = "",
         latex_symbols = "",
       })[entry.source.name]

      vim_item.kind = kind_icons[vim_item.kind] and (kind_icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
      -- or just show the icon
      -- vim_item.kind = icons[vim_item.kind] and icons[vim_item.kind] or vim_item.kind
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<C-k>"] = cmp.mapping(function(fallback)
      vim.snippet.jump(1)
    end, { "i", "s" }),
    ["<C-j>"] = cmp.mapping(function(fallback)
      vim.snippet.jump(-1)
    end, { "i", "s" }),
  }),
  experimental = {
    ghost_text = true,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "rg" },
    { name = "calc" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})
