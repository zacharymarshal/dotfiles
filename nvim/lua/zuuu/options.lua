vim.g.mapleader = " "

local opt = vim.opt

opt.encoding = "utf-8"

opt.backspace = "indent,eol,start"
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.history = 50
opt.ruler = true
opt.showcmd = true
opt.autowrite = true
opt.modelines = 0
opt.modeline = false

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "·" }

opt.startofline = false
opt.joinspaces = false

opt.number = true
opt.relativenumber = true
opt.numberwidth = 5

opt.autoindent = true

opt.incsearch = true
opt.hlsearch = true

opt.splitbelow = true
opt.splitright = true

opt.textwidth = 100
opt.colorcolumn = "+1"

opt.wildmode = "list:longest"

opt.mouse = ""
opt.clipboard = ""

opt.tags = "./tags,tags,.git/tags"
