"####################Magic vimrc########################
" ctrl+n Enable/disable mouse
" ctrl+b Switch to text/binary
" ctrl+j To utf-8 file
" ctrl+t Convert tab to spaces
" ctrl+l Toggle line breaking
" ctrl+f Switch to full/simple

"####################Vundle#############################
set nocompatible                " 開啟/關閉vim的vi相容模式。
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"####################NERDTree###########################
nmap <F5> <ESC>:NERDTree<CR>

"####################編輯喜好設定#######################
syntax enable                   " 開啟/關閉vim的程式碼語法高亮支援。
set number                      " 顯示行號。
" set relativenumber            " 顯示相對行號。
set noruler                     " 開啟/關閉vim的游標座標顯示。
set ignorecase                  " 開啟/關閉vim的忽略大小寫搜尋。
set smartcase                   " 開啟/關閉vim的智慧大小寫搜尋。
set incsearch                   " 開啟/關閉vim的加強版搜尋功能。
set cindent                     " 開啟/關閉vim的自動縮排功能。
set clipboard=unnamedplus       " 與系統剪貼簿同步。
set expandtab                   " 使用空格取代TAB。
set tabstop=4                   " 空格數量。
set softtabstop=4               " 虛擬Tab空格數量。
set shiftwidth=4                " TAB字元和用來擴展的空格字元組合成的字元寬度。
set smarttab                    " 智慧TAB功能。
set confirm                     " 開啟/關閉vim的確認功能。
set backspace=indent,eol,start  " 設定「backspace」鍵的功能。「indent」表示允許使用「backspace」鍵來刪除縮排；「eol」表示允許使用「backspace」來刪除換行字元，使其可以退回至上一行；「start」表示允許使用「ctrl+w」和「ctrl+u」快速鍵來刪除獨立詞語和同類字元(縮排、非縮排字元)。
set history=500                 " 設定vim記錄已執行指令的數量上限。
set showcmd                     " 開啟/關閉vim的指令暫存提示。
set showmode                    " 開啟/關閉vim的模式提示。
set nowrap                      " 開啟/關閉vim的自動換行。
set autowrite                   " 開啟/關閉vim的自動存檔。
set mouse=a                     " 開啟/關閉vim的滑鼠控制功能。「n」為一般模式；「v」為視覺模式；「i」為插入模式；「c」為命令列模式；「a」為所有模式。

"####################Color##############################
set t_Co=256                    " 支援256色。
colo torte                      " Themes
set cursorline                  " 顯示游標所在的列。
set cursorcolumn                " 顯示游標所在的行。
set hlsearch                    " 開啟/關閉vim的搜尋結果高亮提示。
hi CursorLine cterm=none ctermbg=DarkMagenta ctermfg=White
hi CursorColumn cterm=none ctermbg=DarkMagenta ctermfg=White
hi Search cterm=reverse ctermbg=none ctermfg=none

"####################Statusline###################################
set laststatus=2                " 開啟/關閉vim的狀態列。
set statusline=%#filepath#[%{expand('%:p')}]%#filetype#[%{strlen(&fenc)?&fenc:&enc},\ %{&ff},\ %{strlen(&filetype)?&filetype:'plain'}]%#filesize#%{FileSize()}%{IsBinary()}%=%#position#%c,%l/%L\ [%3p%%]
hi filepath cterm=none ctermbg=238 ctermfg=40
hi filetype cterm=none ctermbg=238 ctermfg=45
hi filesize cterm=none ctermbg=238 ctermfg=225
hi position cterm=none ctermbg=238 ctermfg=228
function IsBinary()
    if (&binary == 0)
        return ""
    elsea
        return "[Binary]"
    endif
endfunction
function FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return "[Empty]"
    endif
    if bytes < 1024
        return "[" . bytes . "B]"
    elseif bytes < 1048576
        return "[" . (bytes / 1024) . "KB]"
    else
        return "[" . (bytes / 1048576) . "MB]"
    endif
endfunction

"####################vim的多國語系編碼判斷##############
" encode
if has("multi_byte")
    set fileencodings=utf-8,utf-16,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1
else
    echoerr "If +multi_byte is not included, you should compile Vim with big features."
endif

"####################自訂的快速鍵#######################
" Toggle mouse 使用「ctrl+n」來切換滑鼠模式
map <C-n> :call SwitchMouseMode()<CR>
map! <C-n> <Esc>:call SwitchMouseMode()<CR>
function SwitchMouseMode()
    if (&mouse == "a")
        let &mouse = ""
        echo "Mouse is disabled."
    else
        let &mouse = "a"
        echo "Mouse is enabled."
    endif
endfunction

" Toggle text/binary 使用「ctrl+b」來切換文字/二進制模式
map <C-b> :call SwitchTextBinaryMode()<CR>
map! <C-b> <Esc>:call SwitchTextBinaryMode()<CR>
function SwitchTextBinaryMode()
    if (&binary == 0)
        set binary
        set noeol
        echo "Switch to binary mode."
    else
        set nobinary
        set eol
        echo "Switch to text mode."
    endif
endfunction

" To utf-8 file 使用「ctrl+j」強制將目前開啟的文件轉成UTF-8編碼
map <C-j> :call ToUTF8()<CR>
map! <C-j> <Esc>:call ToUTF8()<CR>
function ToUTF8()
    if (&fileencoding == "utf-8")
        echo "It is already UTF-8."
    else
        let &fileencoding="utf-8"
        echo "Convert to UTF-8."
    endif
    let &ff="unix"
endfunction

" Convert tab to spaces 使用「ctrl+t」將所有「TAB」字元轉成空格字元
map <C-t> :call TabToSpaces()<CR>
map! <C-t> <Esc>:call TabToSpaces()<CR>
function TabToSpaces()
    retab
    echo "Convert tab to spaces."
endfunction

" Toggle line breaking 使用「ctrl+l」來切換自動斷行模式
map <C-l> :call SwitchLineBreakingMode()<CR>
map! <C-l> <Esc>:call SwitchLineBreakingMode()<CR>
function SwitchLineBreakingMode()
    if (&wrap == 0)
        set wrap
        echo "Switch to line breaking mode."
    else
        set nowrap
        echo "Switch to one line mode."
    endif
endfunction

" Switch to full/simple 使用「ctrl+f」來切換完整/簡單模式
map <C-f> :call SwitchFullSimpleMode()<CR>
map! <C-f> <Esc>:call SwitchFullSimpleMode()<CR>
function SwitchFullSimpleMode()
    if (&mouse == "a")
        let &mouse = ""
        set nocindent
        set nonumber
        set wrap
        echo "Switch to simple mode.(nomouse, nonumber, nocindent, wrap)"
    else
        let &mouse = "a"
        set cindent
        set number
        set nowrap
        echo "Switch to full mode.(mouse, number, cindent, nowrap)"
    endif
endfunction

" 開啟半透明背景
hi Normal guibg=NONE ctermbg=NONE

