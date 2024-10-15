return {
  "mfussenegger/nvim-lint",
  config = function()
    require("lint").linters_by_ft = {
      markdown = { "vale" },
      svelte = { "eslint" },
      javascript = { "eslint" },
      typescript = { "eslint" },
    }
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
