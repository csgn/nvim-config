vim.opt.backup = false                          -- creates a backup file
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = true
vim.opt.scrolloff = 8                          
vim.opt.sidescrolloff = 8
vim.opt.wrap = false                            -- display lines as one long line


vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
