" nnoremap <C-n> :NvimTreeToggle<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>

nnoremap <leader><leader> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <C-\> :NvimTreeFindFile<CR>

" More available functions:
" NvimTreeOpen
" NvimTreeClose
" NvimTreeFocus
" NvimTreeFindFileToggle
" NvimTreeResize
" NvimTreeCollapse
" NvimTreeCollapseKeepBuffers

" set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue


lua << EOF

-- empty setup using defaults: add your own options

-- require'nvim-tree'.setup {
-- }

-- OR

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = true,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = true,
  reload_on_bufenter = false,
  respect_buf_cwd = true,
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = true,
      list = {
        -- user mappings go here
	      { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit_no_picker" },
	      { key = "E",                            action = "edit_in_place" },
	      { key = {"O"},                          action = "edit" },
	      { key = {"<2-RightMouse>", "C"},        action = "cd" },
	      { key = "v",                            action = "vsplit" },
	      { key = "s",                            action = "split" },
	      { key = "<C-t>",                        action = "tabnew" },
	      { key = "<",                            action = "prev_sibling" },
	      { key = ">",                            action = "next_sibling" },
	      { key = "P",                            action = "parent_node" },
	      { key = {"x", "<BS>"},                  action = "close_node" },
	      { key = "<Tab>",                        action = "preview" },
	      { key = "K",                            action = "first_sibling" },
	      { key = "J",                            action = "last_sibling" },
	      { key = "I",                            action = "toggle_git_ignored" },
	      { key = "H",                            action = "toggle_dotfiles" },
	      { key = "R",                            action = "refresh" },
	      { key = "a",                            action = "create" },
	      { key = "d",                            action = "remove" },
	      { key = "D",                            action = "trash" },
	      { key = "r",                            action = "rename" },
	      { key = "<C-r>",                        action = "full_rename" },
	      { key = "X",                            action = "cut" },
	      { key = "c",                            action = "copy" },
	      { key = "p",                            action = "paste" },
	      { key = "y",                            action = "copy_name" },
	      { key = "Y",                            action = "copy_path" },
	      { key = "gy",                           action = "copy_absolute_path" },
	      { key = "[c",                           action = "prev_git_item" },
	      { key = "]c",                           action = "next_git_item" },
	      { key = "u",                            action = "dir_up" },
	      { key = "so",                           action = "system_open" },
	      { key = "q",                            action = "close" },
	      { key = "g?",                           action = "toggle_help" },
	      { key = 'W',                            action = "collapse_all" },
	      { key = "S",                            action = "search_node" },
	      { key = ".",                            action = "run_file_command" },
	      { key = "<C-k>",                        action = "toggle_file_info" },
	      { key = "U",                            action = "toggle_custom" },
      },
    },
  },
  renderer = {
    add_trailing = true,
    group_empty = false,
    highlight_git = true,
    full_name = false,
    highlight_opened_files = "icon", 
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
	item = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        git = true,
        file = true,
        folder = true,
        folder_arrow = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Makefile", "README.md", "readme.md", "Cargo.toml" }, 
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
} -- END_DEFAULT_OPTS

EOF
