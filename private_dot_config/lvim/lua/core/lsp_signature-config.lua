local clangd_config = require('lspconfig').clangd


clangd_config.setup({
  settings = {
    cmd = { "clangd" },
    single_file_support = true
  }
})
