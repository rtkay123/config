return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "DapToggleBreakpoint" },
    },
    config = function()
      require("config.custom.dap")
    end
  },
  {
    'mrcjkb/rustaceanvim',
    dependencies = { "mfussenegger/nvim-dap" },
    version = '^5', -- Recommended
    lazy = false,   -- This plugin is already lazy
    config = function()
      local configs = require('config.custom.lsp.init');
      local A = require("config.custom.lsp.on_attach")

      vim.g.rustaceanvim = {
        server = {
          on_attach = A.on_attach,
          default_settings = configs.rust_analyzer.settings
          ,
        },
        -- DAP configuration
        dap = {
          require("config.custom.dap")
        },
      }

      require('rustaceanvim')
    end
  }
}
