-- local trim_spaces = true
-- vim.keymap.set("v", "<space>tt", function()
--     require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
-- end)
-- require'toggleterm'.setup {
--   shade_terminals = false
-- }
vim.keymap.set("n", "<space>tt", ":ToggleTerm<CR>")
vim.keymap.set("n", "<space>td", ":ToggleTerm dir=%:p:h<CR>")
