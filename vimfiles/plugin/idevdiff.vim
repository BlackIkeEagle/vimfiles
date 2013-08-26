command! -n=? -complete=dir -bar DiffWithSaved :call DiffWithSaved()
command! -n=? -complete=dir -bar DiffOff :call DiffOff()

function DiffWithSaved()
	let filetype=&ft
	diffthis
	vnew | r # | normal! 1Gdd
	diffthis
	exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction

function DiffOff()
	q
	diffoff
endfunction
