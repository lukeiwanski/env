syntax on
set autoindent
set tabstop=2
colorscheme Tomorrow-Night
set number
set title
set nobackup
set noswapfile
set colorcolumn=80
set hidden
set history=10000
set pastetoggle=<F2>

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
	set grepformat^=%f:%l:%c:%m " file:line:column:message
endif

function! MySearch()
  let grep_term = input("Search term: ")
	if !empty(grep_term)
	  execute 'silent grep' grep_term | copen
	else
		echo "Empty search term"
	endif
	redraw!
endfunction

command! Search call MySearch()

nnoremap <leader>s : Search<CR>
nnoremap <leader>* :silent grep <cword> \| copen<CR><C-l>
nnoremap <leader>q :cclose<CR>

map <C-j> :cn<CR>
map <C-k> :cp<CR>

map <C-Up> :wincmd k<CR>
map <C-Down> :wincmd j<CR>
map <C-Left> :wincmd h<CR>
map <C-Right> :wincmd l<CR>
