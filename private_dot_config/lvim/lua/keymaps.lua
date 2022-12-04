-- Custom keymaps

lvim.builtin.which_key.mappings["x"] = { ":x<cr>", "Save & Exit" }
lvim.builtin.which_key.mappings["X"] = { ":xall<cr>", "Save All & Exit" }

lvim.builtin.which_key.mappings["]"] = { ":BufferLineCycleNext<CR>", "BufferLineCycleNext" }
lvim.builtin.which_key.mappings["["] = { ":BufferLineCyclePrev<CR>", "BufferLineCyclePrev" }

-- hop.nvim
-- vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
-- vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })

-- telescope.nvim
lvim.builtin.which_key.mappings["sg"] = { "<cmd>Telescope live_grep<cr>", "Live grep" }
