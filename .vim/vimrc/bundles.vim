
" +-------------------------------------------------------------------------------------------------
" | Bundles Config
" +-------------------------------------------------------------------------------------------------

if 1 == VimRCBundlesStandard

	" NERDTree:	Explorer for vim
	Plugin 'scrooloose/nerdtree'

	" NERDTreeTabs: Handles NERDTree with tabs
	Plugin 'jistr/vim-nerdtree-tabs'

	" Airline: Modified tab lines
	Plugin 'bling/vim-airline'

	" Tmuxline: tmux statusline generator and airline integration
	Plugin 'edkolev/tmuxline.vim'

	" Indent Guides: Visually displaying indent levels
	Plugin 'nathanaelkane/vim-indent-guides'

	" Obsession: Writes the current state of Vim
	"Plugin 'tpope/vim-obsession'

	" Rainbow: Colorizes parentheses, brackets etc.
	"Plugin 'oblitum/rainbow'

	"Plugin 'EasyMotion'
	"Plugin 'surround.vim'
	"Plugin 'godlygeek/tabular'
	"Plugin 'tpope/vim-eunuch'

	" Vimshell:
	"Plugin 'Shougo/vimshell.vim'

endif


if 1 == VimRCBundlesDevel

	" Taglist: Lists all Tags of a source file
	Plugin 'taglist.vim'

	" DelimitMate: Closes strings etc.
	Plugin 'Raimondi/delimitMate'

	" TComment: provides file-type sensible comments
	Plugin 'tomtom/tcomment_vim'

	" UltiSnps: Code Snippets
	Plugin 'SirVer/ultisnips'
	" Plugin 'honza/vim-snippets'

	" YouCompleteMe: AutoCompletion for C-Semantic languages
	"Plugin 'oblitum/YouCompleteMe'

	" SuperTab: Brings all TAB-Key based Plugins together
	"Plugin 'ervandew/supertab'

	" Syntastic: On the fly syntax checking
	"Plugin 'scrooloose/syntastic'

	" Clang Format: Formats C++ code with specific coding style
	"Plugin 'rhysd/vim-clang-format'

	" SingleCompile: Makes it more convenient to compile
	"Plugin 'xuhdev/SingleCompile'

endif

