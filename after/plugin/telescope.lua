local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>' , builtin.git_files,{})

local telescope = require('telescope')
telescope.setup({
    extensions = {
        media_files = {
            filetypes = { "png", "jpg", "jpeg", "gif", "webp", "svg", "avif" },
            find_cmd = "find",
        },
    },
})
pcall(telescope.load_extension, "media_files")

vim.keymap.set('n', '<leader>fi', telescope.extensions.media_files.media_files, { desc = "Find images" })
