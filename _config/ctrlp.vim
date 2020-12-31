if empty(globpath(&rtp, 'autoload/ctrlp.vim'))
	  finish
  endif

" CtrlP
nmap <c-e> <plug>(ctrlp-launcher)
nnoremap ,g :<c-u>CtrlPGitFiles<cr>
nnoremap ,v :<c-u>CtrlPLauncher lsp<cr>
nnoremap ,, :<c-u>CtrlPMRUFiles<cr>

