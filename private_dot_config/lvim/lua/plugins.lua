-- Custom plugins

lvim.plugins = {
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      -- See keymaps
      -- vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      -- vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
}
