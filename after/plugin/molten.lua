local ok, _ = pcall(require, "molten")
if not ok then return end

local map = function(keys, func, desc)
    vim.keymap.set("n", keys, func, { desc = desc, silent = true })
end

map("<leader>mi", ":MoltenInit<CR>",              "Molten: init kernel")
map("<leader>mo", ":MoltenEvaluateOperator<CR>",  "Molten: run operator")
map("<leader>ml", ":MoltenEvaluateLine<CR>",      "Molten: run line")
map("<leader>mr", ":MoltenReevaluateCell<CR>",    "Molten: re-run cell")
map("<leader>md", ":MoltenDelete<CR>",            "Molten: delete cell")
map("<leader>mh", ":MoltenHideOutput<CR>",        "Molten: hide output")
map("<leader>ms", ":MoltenShowOutput<CR>",        "Molten: show output")

vim.keymap.set("v", "<leader>mr", ":<C-u>MoltenEvaluateVisual<CR>",
    { desc = "Molten: run visual selection", silent = true })
