" ==========================================
"  bundle 插件管理和配置项
" -----------------#github
"   插件来自 github，只需要 ： 作者名/项目名
"  Bundle 'tomasr/molokai'
"   插件来自 vim-scripts，直接写插件名就行了
"  Bundle 'L9'
"   如使用自己的git库的插件，像下面这样做
"  Bundle 'git://git.wincent.com/command-t.git'
" ---------------#git库在本地机器的情况
"   如使用自己的git库在本地机器，像下面这样做
"  Bundle 'file:///Users/gmarik/path/to/plugin'
"
" ==========================================
set nocompatible               " be iMproved
filetype off " required! turn off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" ################### Bundles 配置 #########################
" 使用Vundle来管理插件
" vim plugin bundle control, command model
"     :BundleInstall     install 安装配置的插件
"     :BundleInstall!    update  更新
"     :BundleClean       remove plugin not in list 删除本地无用插件

" ##### 插件管理工具
Bundle 'gmarik/vundle'

" ###### 主题 molokai 和 Solarized
Bundle 'tomasr/molokai'
let g:molokai_original = 1
Bundle 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" 主题使用
set background=dark
"set background=light
set t_Co=256
colorscheme molokai
" colorscheme solarized

" ###### 中文 vim 帮助
Bundle 'asins/vimcdoc'


" 标签导航
Bundle 'majutsushi/tagbar'
nmap <F3> :TagbarToggle<CR>
nmap <leader>m :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = 2
let g:tagbar_autoshowtag = 1
autocmd VimEnter * nested :call tagbar#autoopen(1) "打开vim时自动打开
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"如果是c语言的程序的话，tagbar自动开启
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"" cpp类型
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
" markdown
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }
" Makefile (targets)
let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}
" obj-c
let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }
" R
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }
" for ruby
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
" 去除taglist =>原因: 使用tagbar和ctrlp-funky可以直接快速跳转函数和变量位置,taglist有些多余


" ##### 目录导航
Bundle 'jistr/vim-nerdtree-tabs'
""""""
map <Leader>n <plug>NERDTreeTabsToggle<CR>
    " 关闭同步
let g:nerdtree_tabs_synchronize_view=0
let g:nerdtree_tabs_synchronize_focus=0
    " 自动开启nerdtree
let g:nerdtree_tabs_open_on_console_startup=0



" ##### 自动根据当前打开文件切换工作目录
"Bundle 'airblade/vim-rooter'
"let g:rooter_disable_map = 1

" ##### 缩进标识
Bundle 'nathanaelkane/vim-indent-guides'
        " 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
        " 从第二层开始可视化显示缩进
let g:indent_guides_start_level=1
        " 色块宽度
let g:indent_guides_guide_size=1
        " 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"Bundle 'taglist.vim'
"let Tlist_Ctags_Cmd='ctags'
"let Tlist_Show_One_File=1
"let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_WinWidt=60                   "设置taglist的宽度
"let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Windo=1             "在左侧窗口中显示taglist窗口 
"let Tlist_Auto_Open=1

" ###### 多语言语法检查
Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_error_symbol='✘✘'
let g:syntastic_warning_symbol='➤➤'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_highlighting=1
    " 使用pyflakes,速度比pylint快
let g:syntastic_python_checkers=['pep8', 'pyflakes']
let g:syntastic_python_pep8_args='--ignore=E501,E225'
    " 修改高亮的背景色, 适应主题
highlight SyntasticErrorSign guifg=white guibg=black
" to see error location list
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_loc_list_height = 5
function! ToggleErrors()
    let old_last_winnr = winnr('$')
    lclose
    if old_last_winnr == winnr('$')
        " Nothing was closed, open syntastic error location panel
        Errors
    endif
endfunction
nnoremap <Leader>s :call ToggleErrors()<cr>
nnoremap <Leader>sn :lnext<cr>
nnoremap <Leader>sp :lprevious<cr>
        " 关闭 C 的语法检测, 主要是用于 lpc
" let g:syntastic_ignore_files=[".*\.c$", ".*\.decl$"]

" ##### 代码片段快速插入
Bundle 'SirVer/ultisnips'
"   Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
" 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
" 进入对应filetype的snippets进行编辑
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
map <leader>us :UltiSnipsEdit<CR>
" ctrl+j/k 进行选择
func! g:JInYCM()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<c-j>"
    endif
endfunction
func! g:KInYCM()
    if pumvisible()
        return "\<C-p>"
    else
        return "\<c-k>"
    endif
endfunction
inoremap <c-j> <c-r>=g:JInYCM()<cr>
au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
let g:UltiSnipsJumpBackwordTrigger = "<c-k>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" #### 主要用于 C/C++ 代码补全，需要 ctag 支持
Bundle 'vim-scripts/OmniCppComplete'


" ##### Python 代码补全
Bundle 'vim-scripts/Pydiction'
let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'

" ##### Python 快捷操作
Bundle 'yssource/python.vim'

" ###### 自动补全单引号，双引号等
Bundle 'Raimondi/delimitMate'
    " for python docstring ,优化输入
au FileType python let b:delimitMate_nesting_quotes = ['"']


" ###### 快速注释
Bundle 'scrooloose/nerdcommenter'
" <leader>cc 注释选中内容
" <leader>cu 取消选中注释
" <leader>c$ 从当前光标开始到行尾注释掉
let g:NERDSpaceDelims=1


" ##### 快速去行尾空格
Bundle 'bronson/vim-trailing-whitespace'
" 下列文件类型中的行尾空格tab不高亮显示
let g:extra_whitespace_ignored_filetypes = ['unite', 'mkd', 'h', 'hpp', 'c', 'cpp', 'py']
map <leader>, :FixWhitespace<cr>


" ##### 更高效的移动 [,, + w/fx]
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
        " 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)


" ##### 快速的匹配 https://github.com/vim-scripts/matchit.zip
Bundle 'vim-scripts/matchit.zip'


" ##### 显示marks - 方便自己进行标记和跳转
" m[a-zA-Z] add mark
" '[a-zA-Z] go to mark
Bundle "kshenoy/vim-signature"
" 书签设定。mx，设定/取消当前行名为 x 的标签；m,，自动设定下一个可用书签名，
"   前面提说，独立书签名是不能重复的，在你已经有了多个独立书签，
"   当想再设置书签时，需要记住已经设定的所有书签名，否则很可能会将已有的书签冲掉，这可不好，
"   所以，vim-signature 为你提供了 m, 快捷键，
"   自动帮你选定下一个可用独立书签名；mda，删除当前文件中所有独立书签。
" 书签罗列。ms，罗列出当前文件中所有书签，选中后回车可直接跳转；
" 书签跳转。mn，按行号前后顺序，跳转至下个独立书签；
"   mp，按行号前后顺序，跳转至前个独立书签。
"   书签跳转方式很多，除了这里说的行号前后顺序，
"   还可以基于书签名字母顺序跳转、分类书签同类跳转、分类书签不同类间跳转等等。
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }"]]]']"}


" ##### 选中区块
Bundle 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)


" ##### 多光标选中编辑
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'


" ##### 文件搜索 change to https://github.com/ctrlpvim/ctrlp.vim
Bundle 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" 如果安装了ag, 使用ag
" if executable('ag')
  " " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " " ag is fast enough that CtrlP doesn't need to cache
  " let g:ctrlp_use_caching = 0
" endif


" ###### ctrlp插件1 - 不用ctag进行函数快速跳转
Bundle 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
    " narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']


" ##### 括号显示增强
Bundle 'kien/rainbow_parentheses.vim'
" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],
let g:rbpt_colorpairs = [
\ ['brown',       'RoyalBlue3'],
\ ['Darkblue',    'SeaGreen3'],
\ ['darkgray',    'DarkOrchid3'],
\ ['darkgreen',   'firebrick3'],
\ ['darkcyan',    'RoyalBlue3'],
\ ['darkred',     'SeaGreen3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['brown',       'firebrick3'],
\ ['gray',        'RoyalBlue3'],
\ ['darkmagenta', 'DarkOrchid3'],
\ ['Darkblue',    'firebrick3'],
\ ['darkgreen',   'RoyalBlue3'],
\ ['darkcyan',    'SeaGreen3'],
\ ['darkred',     'DarkOrchid3'],
\ ['red',         'firebrick3'],
\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" ##### python fly check, 弥补syntastic只能打开和保存才检查语法的不足
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0


" ##### pythgon的语法高亮 for python.vim syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1


" ##### Markdown
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_no_default_key_mappings=1
" https://github.com/suan/vim-instant-markdown
" npm -g install instant-markdown-d


" ##### Markdown Preview
Bundle 'suan/vim-instant-markdown'
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
map <F12> :InstantMarkdownPreview<CR>


" ##### 增加对 STL\C++14等的C++语法高亮
Bundle 'Mizuchi/STL-Syntax'


" ##### *.cpp 和 *.h 间切换
Bundle 'vim-scripts/a.vim'
nmap <Leader>ch :A<CR>
    " 子窗口中显示 *.cpp 或 *.h
nmap <Leader>sch :AS<CR>
map <F4> :A<CR>
map <leader><F4> :AS<CR>



" ##### 周期性针对这个工程自动生成标签文件，并通知 vim 引人该标签文件
" Bundle 'vim-scripts/indexer.tar.gz'
" 如果出问题了则使用：
" cd ~/.vim/bundle/
" git clone git@github.com:vim-scripts/indexer.tar.gz
" indexer 使用 ctags 5.8.1
" wget http://dfrank.ru/uploaded_files/ctags/ctags-5.8.1.tar.gz
" 来自 ：http://dfrank.ru/ctags581/en.html
" 依赖项
" Bundle 'DfrankUtil'
" Bundle 'vimprj'
" indexer 还有个自己的配置文件，用于设定各个工程的根目录路径，配置文件位于
" ~/.indexer_files，内容可以设定为：
""""""
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
" let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" --------------- ~/.indexer_files ---------------
"  [foo]
"  /data/workplace/foo/src/
"  [bar]
"  /data/workplace/bar/src/


" #### 标识buff
" Bundle 'fholgado/minibufexpl.vim'
" map <Leader>e :MBEOpen<cr>
" map <Leader>c :MBEClose<cr>
" map <Leader>t :MBEToggle<cr>


" #### 自动补全
Bundle 'vim-scripts/AutoComplPop'


" ##### 比grep搜索更好
" grep foo $(find . -name '*.pm' | grep -v .svn)
Bundle 'mileszs/ack.vim'
" let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
let g:ack_default_options =
              \ " -s -H --color --group --column --smart-case --follow"
map <leader>a :Ack -i


" ##### vim-powerline
Bundle 'Lokaltog/vim-powerline'
" Bundle ' bling/vim-airline'
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" ##### 目录导航
Bundle 'scrooloose/nerdtree'
nmap <F2> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'


" ################## 插件配置结束 ###########################
filetype plugin indent on     " required!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1, "##########################################################################") 
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: vinsion") 
		call append(line(".")+2, "# mail: vinsion@vinsion.mail") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "#########################################################################") 
		call append(line(".")+5, "#!/bin/sh")
		call append(line(".")+6, "")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: vinsion") 
		call append(line(".")+2, "	> Mail: vinsion@vinsion.mail ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include<iostream>")
    	call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8
set tags=tags
set nu
set mouse=a
map <c-]> g<c-]>
