function! s:InitCoc() abort
  " load overrides
  runtime! autoload/coc/ui.vim
  execute "lua vim.notify('Initialized coc.nvim for LSP support', 'info', { title = 'LSP Status' })"
endfunction

lua << EOF

function coc_notify(msg, level)
  local notify_opts = { title = "LSP Message", timeout = 500 }
  vim.notify(msg, level, notify_opts)
end

EOF
