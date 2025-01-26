vim.keymap.set("n", "<space>tt", ":ToggleTerm<CR>") -- open terimal in the current directory
vim.keymap.set("n", "<space>td", ":ToggleTerm dir=%:p:h<CR>") -- open terminal in the directory of the file
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
