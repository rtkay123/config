return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "DapToggleBreakpoint" },
      { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "DapContinue" },
    },
    config = function()
      require("config.custom.dap")

      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DiagnosticError', linehl = 'DiagnosticWarn', numhl = '' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })
      vim.fn.sign_define('DapLog', { text = '', texthl = 'Keyword', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DiagnosticError', linehl = '', numhl = '' })
    end
  }
}
