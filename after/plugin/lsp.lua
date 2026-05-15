require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "rust_analyzer" },
    automatic_enable = true,
})

require("luasnip.loaders.from_vscode").lazy_load()

-- Diagnostic signs and display
vim.diagnostic.config({
    virtual_text = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN]  = "W",
            [vim.diagnostic.severity.HINT]  = "H",
            [vim.diagnostic.severity.INFO]  = "I",
        },
    },
})

-- Keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf, remap = false }
        vim.keymap.set("n", "gd",          vim.lsp.buf.definition,       opts)
        vim.keymap.set("n", "K",           vim.lsp.buf.hover,            opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd",  vim.diagnostic.open_float,    opts)
        vim.keymap.set("n", "[d",          vim.diagnostic.goto_next,     opts)
        vim.keymap.set("n", "]d",          vim.diagnostic.goto_prev,     opts)
        vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,      opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references,       opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename,           opts)
        vim.keymap.set("i", "<C-h>",       vim.lsp.buf.signature_help,   opts)
    end,
})

-- Suppress 'vim' global warning in lua files
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
        },
    },
})

-- nvim-cmp completion
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"]     = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-n>"]     = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-y>"]     = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
})
