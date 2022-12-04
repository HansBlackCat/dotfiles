local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- lua
    null_ls.builtins.diagnostics.checkmake,
    -- c/c++
    null_ls.builtins.diagnostics.cppcheck,
  },
})
