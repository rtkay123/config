local lsp = require("config.custom.lsp")

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'j-hui/fidget.nvim',
        opts = {
          -- Options related to notification subsystem
          notification = {

            -- Options related to how notifications are rendered as text
            view = {
              stack_upwards = true,    -- Display notification items from bottom to top
              icon_separator = " ",    -- Separator between group name and icon
              group_separator = "---", -- Separator between notification groups
              group_separator_hl =     -- Highlight group used for group separator
              "Comment",
              render_message =         -- How to render notification messages
                  function(msg, cnt)
                    return cnt == 1 and msg or string.format("(%dx) %s", cnt, msg)
                  end,
            },

            -- Options related to the notification window and buffer
            window = {
              winblend = 0,    -- Background color opacity in the notification window
              border = "none", -- Border around the notification window
              x_padding = 1,   -- Padding from right edge of window boundary
              y_padding = 1,   -- Padding from bottom edge of window boundary
              align = "top",   -- How to align the notification window
            },
          },

        },
      },

    },
    config = function()
      for key, value in pairs(lsp) do
        --        if key ~= 'rust_analyzer' then -- rustacean handles this
        require("lspconfig")[key].setup(value)
        --       end
      end
    end
  },
}
