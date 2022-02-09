---------------------------
-- General settings
-- ------------------------
vim.g.builting_lsp = true
vim.opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
vim.opt.swapfile = false          -- don't use swapfile

-- Behaviors
vim.opt.belloff = "all" -- no bells!
vim.opt.undofile = true -- keeps thack of 'undo's between sessions
vim.opt.confirm = true -- confirm if I want to save
vim.opt.mouse = 'a' -- use mouse to scroll
vim.opt.completeopt = 'menuone,noselect' -- insert mode completion options


-- Indentation
vim.opt.autoindent = true  -- continue indentation to new line
vim.opt.smartindent = true -- add extra indent when it makes sense
vim.opt.smarttab = true -- <Tab> at the start of a line behaves as expected
vim.opt.expandtab = true -- <Tab> inserts spaces
vim.opt.shiftwidth = 4 -- >>, << shift line by 4 spaces
vim.opt.tabstop = 4 -- <Tab> appears as 4 spaces
vim.opt.softtabstop = 4 -- <Tab> behaves as 4 spaces when editing
vim.opt.lazyredraw = true


-- Colors
vim.opt.termguicolors = true
vim.o.background = 'dark'
require("onedarkpro").load()

-- Look and feel
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.number = true -- number
vim.opt.relativenumber = true -- relative number
vim.opt.wrap = false -- don't wrap text
vim.opt.splitright = true -- prefer vsplitting to the right
vim.opt.splitbelow = true -- prefer hsplitting bellow
vim.opt.scrolloff = 10 -- padding between curson adn top/bottom of the window
vim.opt.list = true -- show list chars
vim.opt.listchars = {
    -- these list chars
    tab = "»·",
    nbsp = "␣",
    extends = "…",
    precedes = "…",
    trail = "·",
}


-- Searching
vim.opt.wildmenu = true -- tab complete on command line
vim.opt.ignorecase = true -- case inensitive search...
vim.opt.smartcase = true -- unless I use caps
vim.opt.incsearch = true -- update result while I type
vim.opt.hlsearch = true -- highlight matching text
vim.opt.updatetime = 80 -- Reduce time for highlighting other references
vim.opt.redrawtime = 10000 -- Allow more time for loading syntax on large files
