" Functions
fun! SwitchLineNumeration()
    if &number == 1
        set norelativenumber
        set nonumber
    else
        set relativenumber
        set number
    endif
endfun

" Settings
set timeoutlen=10000
set mouse=a

" Default behaviour
set cpoptions-=_
noremap <C-C> <Esc>
inoremap <C-C> <Esc>
inoremap <C-H> <C-W>
inoremap <C-Del> <Esc>ldea
cnoremap <C-H> <C-W>
cnoremap <C-J> <C-N>
cnoremap <C-K> <C-P>
nnoremap <silent> J :<C-U>execute "join ".(v:count+1)<CR>
"xnoremap < <gv
"xnoremap > >gv
"nnoremap <silent> <CR> :<C-u>put=repeat(nr2char(10),v:count)<Bar>execute "'[-1"<CR>
"nnoremap <silent> <S-CR> :<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "']+1"<CR>

" <Space> mappings
noremap <Space> <Nop>
"noremap <Space>R :source $MYVIMRC<CR>
"noremap <C-Space> i_<Esc>r
noremap <Space>? :set hlsearch!<CR>
"noremap <Space>I :set ic!<CR>
noremap <Space>y "+y
noremap <Space>Y :%y+<CR>
"noremap <Space>V ggVG
"noremap <Space>p "+p
noremap <Space>N :call SwitchLineNumeration()<CR>
noremap <silent> <Space>e :Explore<CR>
noremap <Space>Lr :LspRestart<CR>
noremap <Space>Li :LspInfo<CR>

" Splits
"noremap <C-W>z <C-W>s
" noremap <C-W>z <C-W>s<C-W>j
noremap <C-W>s <C-W>s<C-W>j
noremap <C-W>v <C-W>v<C-W>l
"noremap <C-W>0 <C-W>=
"noremap <silent> <C-W>H :vertical resize -8<CR>
"noremap <silent> <C-W>J :resize -8<CR>
"noremap <silent> <C-W>K :resize +8<CR>
"noremap <silent> <C-W>L :vertical resize +8<CR>

" Tabs
noremap <C-W>c <C-W><esc>
noremap <C-W><C-c> <C-W><esc>
"noremap <silent> <C-W>t :tablast \| tabnew .<CR>
" noremap <silent> <C-W>t :tabnew .<CR>
noremap <silent> <C-W>t <C-W>v<C-W>T
noremap <silent> <C-W>, :tabprevious<CR>
noremap <silent> <C-W>. :tabnext<CR>
for i in range(1, 9)
   execute 'noremap <C-W>'.i.' :'.i.'tabnext<CR>'
endfor
noremap <silent> <C-W>< :-tabmove<CR>
noremap <silent> <C-W>> :+tabmove<CR>
noremap <silent> <C-W>Q :tabclose<CR>

" Jumplist
noremap <silent> } :<C-u>execute "keepjumps norm! " . v:count . "}"<CR>
noremap <silent> { :<C-u>execute "keepjumps norm! " . v:count . "{"<CR>
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'

" Snippets
snoremap <BS> _<C-W>

" Sql
"let g:omni_sql_no_default_maps = 1
let g:ftplugin_sql_omni_key = '<C-S>'

" Plugins
"nnoremap <Space>ut :UndotreeToggle<CR>
