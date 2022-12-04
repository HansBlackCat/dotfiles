local clangd_config = require('lspconfig').clangd
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

clangd_config.setup({
  cmd = { "clangd", "--clang-tidy" },
  filetypes = { "c", "cpp", "cxx", "c++", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
  capabilities = capabilities,
})
