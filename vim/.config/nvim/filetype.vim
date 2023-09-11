if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    " Recognize .zeek files (TEMP)
    au! BufRead,BufNewFile *.zeek setfiletype bro
augroup END
