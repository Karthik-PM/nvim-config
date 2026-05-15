local ok, nn = pcall(require, "notebook-navigator")
if not ok then return end

local map = vim.keymap.set

-- Cell navigation
map("n", "]h", function() nn.move_cell("d") end, { desc = "Next cell" })
map("n", "[h", function() nn.move_cell("u") end, { desc = "Prev cell" })

-- Run cells
map("n", "<leader>rc", function() nn.run_cell() end,        { desc = "Run cell" })
map("n", "<leader>rn", function() nn.run_and_move() end,    { desc = "Run cell and move" })
map("n", "<leader>ra", function() nn.run_all_cells() end,   { desc = "Run all cells" })

-- Cell text objects (requires mini.ai or compatible)
map({ "o", "x" }, "ih", function() nn.select_cell() end, { desc = "Select cell" })
