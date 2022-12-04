-- Show nearest method/function in the statusline
vim.cmd([[
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
]])

lvim.builtin.which_key.mappings["v"] = { "<cmd>Vista!!<cr>", "Toggle Vista" }

vim.g.vista_executive_for = {
  lua = "nvim_lsp"
}
