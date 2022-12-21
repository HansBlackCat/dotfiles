vim.cmd [[
let g:tagbar_width=22
autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)
autocmd BufEnter * nested :call tagbar#autoopen(0)

let g:gutentags_project_root = [ '.git', '.hg', '.svn', '.bzr', '_darcs', '_FOSSIL_', '.fslckout', '.gutentags_root' ]
]]

lvim.builtin.which_key.mappings["a"] = {
  name = "tags",
  t = { "<cmd>TagbarToggle<cr>", "Toggle Tagbar" }
}
