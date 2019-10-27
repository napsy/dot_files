execute pathogen#infect()
syntax on
filetype plugin indent on
set laststatus=2
set t_Co=256
colorscheme molokai

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set mouse=a
set nu

" vim-go specific settings
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_fmt_command = "goimports"

" Set leader
let mapleader = ","

" Ack config
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

if has("gui_running")
	set guioptions-=m  "remove menu bar
	set guioptions-=T  "remove toolbar
	set guioptions-=r  "remove right-hand scroll bar
	set guioptions-=L  "remove left-hand scroll bar
endif

" Set light theme for markdown files
au BufEnter *.md set background=light
au BufEnter *.md colorscheme pencil

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
