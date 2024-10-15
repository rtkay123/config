return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.cmd.colorscheme("gruvbox-material")
      vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'NonText' })
    end
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    --priority = 1000,
    config = function()
      require('nightfox').setup({
        options = {
          transparent = true, -- Disable setting background
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        },
      })
      --   vim.cmd.colorscheme("terafox")
      local palette = require('nightfox.palette').load("terafox")

      -- gray
      vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = palette.bg4 })
      -- blue
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = palette.blue.base })
      vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
      -- light blue
      vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = palette.blue.bright })
      vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
      vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
      -- pink
      vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = palette.pink.base })
      vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
      -- front
      vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = palette.fg0 })
      vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
      vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
    end
  }
} -- lazy
