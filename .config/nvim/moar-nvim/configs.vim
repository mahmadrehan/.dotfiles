" ----------------------------
" -- github copilot config
" ----------------------------

imap <silent><script><expr> <leader>; copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" ----------------------------
" -- other configs
" ----------------------------

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 120})
augroup END

" idrk what this does haha but it's here alright
augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

" ----------------------------
" -- python config
" ----------------------------

if has('nvim') && !empty($CONDA_PREFIX)
  let g:python3_host_prog = $CONDA_PREFIX . '/bin/python'
endif

augroup black_on_save
  autocmd!
  autocmd BufWritePre *.py Black
augroup end

" ----------------------------
" -- airline config
" ----------------------------

let g:airline_powerline_fonts = 1

" ----------------------------
" -- Emmet config
" ----------------------------

" only enable in insert mode
let g:user_emmet_mode="a"
let g:user_emmet_leader_key="<C-l>"

" ----------------------------
" -- dart config

" ----------------------------
let g:dart_format_on_save=1
let g:dart_fmt_options = ['--line-length=92']

" ----------------------------
" -- markdown preview config
" ----------------------------

" open the preview window after entering the markdown buffer
let g:mkdp_auto_start = 0

" auto close current preview window when change
let g:mkdp_auto_close = 1

" refresh markdown when save the buffer or set to 0 for instant refresh
let g:mkdp_refresh_slow = 1

" setting to 1, the MarkdownPreview command can be use for all files,
let g:mkdp_command_for_global = 0

" if set to 1, preview server available to others in your network
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" more detail at: https://github.com/iamcco/markdown-preview.nvim/pull/9
let g:mkdp_open_ip = ''

" specify browser to open preview page
let g:mkdp_browser = 'brave' " default is 0

" set to 1, echo preview page url in command line when open preview page
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = 'Watching ~ ${name}'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" ----------------------------
" -- prettier config
" ----------------------------

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1 " force run async
let g:prettier#config#print_width = '92'
let g:prettier#config#tab_width = '2'
let g:prettier#config#use_tabs = 'auto'
let g:prettier#config#parser = ''
let g:prettier#config#config_precedence = 'file-override'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#config#html_whitespace_sensitivity = 'css'
let g:prettier#config#require_pragma = 'false'

" Define the flavor of line endings
" lf|crlf|cr|all
" defaut: 'lf'
let g:prettier#config#end_of_line = get(g:, 'prettier#config#end_of_line', 'lf')

