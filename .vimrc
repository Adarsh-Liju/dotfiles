"   mm       #                       #             m        "       "         
"   ##    mmm#   mmm    m mm   mmm   # mm          #      mmm     mmm   m   m 
"  #  #  #" "#  "   #   #"  " #   "  #"  #         #        #       #   #   # 
" #mm#  #   #  m"""#   #      """m  #   #         #        #       #   #   # 
"#    # "#m##  "mm"#   #     "mmm"  #   #         #mmmmm mm#mm     #   "mm"# 
"                                                                   #         
"                                                                 ""                                                                                     
"          mm   #                    #                                        
"          ##   #mmm    m mm   mmm   # mm    mmm   mmmmm                      
"         #  #  #" "#   #"  " "   #  #"  #  "   #  # # #                      
"         #mm#  #   #   #     m"""#  #   #  m"""#  # # #                      
"        #    # ##m#"   #     "mm"#  #   #  "mm"#  # # #                      

call plug#begin('~/.vim/plugged')


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

"Surround.vim is all about : parentheses, brackets, quotes, XML
"tags, and more. The plugin provides mappings to easily delete, change and add
"such surroundings in pairs.
Plug 'tpope/vim-surround'

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}


" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
"a nice statusline at the bottom of each vim window
Plug 'vim-airline/vim-airline'

"NERDTree (file explorer for vim)
Plug 'scrooloose/nerdtree'

"syntax checking
Plug 'scrooloose/syntastic'

"Sonokai Color scheme

Plug 'sainnhe/sonokai'
"vim airline themes

Plug 'vim-airline/vim-airline-themes'

"syntax checking using lsp support

Plug 'w0rp/ale'

"markdown preview

Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}


Plug 'nvim-lua/completion-nvim'

" Ayu theme
Plug 'ayu-theme/ayu-vim'

" Async Support

Plug 'skywind3000/asyncrun.vim'

" Pandoc MD Preview
Plug 'conornewton/vim-pandoc-markdown-preview'
" ARM syntax
Plug 'ARM9/arm-syntax-vim'
" Initialize plugin system

call plug#end()
set termguicolors
let ayucolor="dark"
colorscheme ayu
set number
