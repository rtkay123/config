return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "DapToggleBreakpoint" },
    },
    config = function()
      require("config.custom.dap")
    end,
  },
}
