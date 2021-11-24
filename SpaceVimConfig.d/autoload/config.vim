function! config#after() abort
    " Set lenguages
    set spelllang=es,en
    
    let g:neomake_rust_enabled_makers = ['rustc']
endfunction
