vim.cmd([[
" Add additional information on airline
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' '). ' ' . get(g:, 'coc_status', '') . ' ' . get(b:, 'coc_current_function', '')
endfunction

let g:airline_section_c = '%{StatusDiagnostic()}'

" Enable tab feature
" let g:airline#extensions#tabline#enabled = 1
]])

