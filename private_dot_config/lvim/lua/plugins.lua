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
  {
    "liuchengxu/vista.vim"
  },
  {
    'wfxr/minimap.vim',
    run = "cargo install --locked code-minimap",
    cmd = { "Minimap", "MinimapClose", "MinimapToggle", "MinimapRefresh", "MinimapUpdateHighlight" },
    config = function()
      vim.cmd("let g:minimap_width = 10")
      vim.cmd("let g:minimap_auto_start = 1")
      vim.cmd("let g:minimap_auto_start_win_enter = 1")
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
}