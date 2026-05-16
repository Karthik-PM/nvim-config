# nvim-config

Personal Neovim config in Lua. Requires **Neovim 0.12+**.

![preview](https://github.com/user-attachments/assets/a435ce27-f241-4e3e-aba4-7a45e710f532)

---

## Installation

### 1. Install Neovim 0.12+ (AppImage)

```bash
mkdir -p ~/bin
curl -Lo ~/bin/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x ~/bin/nvim.appimage
ln -sf ~/bin/nvim.appimage ~/bin/nvim

# Add ~/bin to PATH (add to ~/.bashrc or ~/.zshrc)
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

### 2. Clone this config

```bash
git clone https://github.com/Karthik-PM/nvim-config ~/.config/nvim
```

### 3. Install system dependencies

```bash
# Image rendering (for molten-nvim and image.nvim)
sudo apt install ueberzugpp imagemagick

# Python packages (for Jupyter notebook support)
pip install pynvim jupyter_client jupytext
```

### 4. Open Neovim and install plugins

```
nvim
```

Lazy.nvim bootstraps itself on first launch. Then run:

```
:Lazy sync
:UpdateRemotePlugins
```

Mason will install LSP servers automatically (`lua_ls`, `ts_ls`, `rust_analyzer`).

---

## Plugins

| Plugin | Purpose |
|---|---|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Plugin manager |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/tool installer |
| [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim) | Auto-enable LSP servers |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippets |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder |
| [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua) | File explorer |
| [image.nvim](https://github.com/3rd/image.nvim) | Inline image rendering |
| [molten-nvim](https://github.com/benlubas/molten-nvim) | Jupyter kernel integration |
| [jupytext.nvim](https://github.com/GCBallesteros/jupytext.nvim) | `.ipynb` ↔ `.py` conversion |
| [NotebookNavigator.nvim](https://github.com/GCBallesteros/NotebookNavigator.nvim) | Cell navigation and execution |
| [avante.nvim](https://github.com/yetone/avante.nvim) | AI assistant (Cursor-like) |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code terminal integration |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Terminal UI (claudecode.nvim dependency) |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal integration |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [vim-fugitive](https://github.com/tpope/vim-fugitive) | Git integration |
| [undotree](https://github.com/mbbill/undotree) | Undo history visualizer |
| [vimtex](https://github.com/lervag/vimtex) | LaTeX support |

---

## Keymaps

Leader key: `Space`

### General

| Key | Action |
|---|---|
| `<leader>pv` | Open file explorer (netrw) |
| `<leader>f` | Format file |
| `<leader>s` | Search & replace word under cursor |
| `<leader>x` | Make file executable |
| `<leader>y` / `<leader>Y` | Copy to system clipboard |
| `<leader>p` | Paste without overwriting register |
| `<C-d>` / `<C-u>` | Scroll half-page (cursor centered) |
| `<leader>dt` | Open Terminator in file's directory |
| `<leader>dr` | Open Terminator |

### LSP

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<leader>vrn` | Rename symbol |
| `<leader>vca` | Code action |
| `<leader>vrr` | References |
| `<leader>vd` | Open diagnostics float |
| `[d` / `]d` | Next / prev diagnostic |
| `<leader>vws` | Workspace symbol search |
| `<C-h>` (insert) | Signature help |

### Telescope

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<C-p>` | Git files |
| `<leader>fi` | Find images (media files) |

### Jupyter / Molten

| Key | Action |
|---|---|
| `<leader>mi` | Init Jupyter kernel (`:MoltenInit`) |
| `<leader>rc` | Run current cell |
| `<leader>rn` | Run cell and move to next |
| `<leader>ra` | Run all cells |
| `<leader>ml` | Run current line |
| `<leader>mr` | Re-run cell / run visual selection |
| `<leader>ms` | Show cell output |
| `<leader>mh` | Hide cell output |
| `<leader>md` | Delete cell output |
| `]h` / `[h` | Next / prev cell |

### Claude Code

Requires the [Claude Code CLI](https://claude.ai/code) to be installed (`npm install -g @anthropic-ai/claude-code`).

| Key | Action |
|---|---|
| `<leader>ac` | Toggle Claude terminal |
| `<leader>af` | Focus Claude terminal |
| `<leader>ar` | Resume previous session |
| `<leader>aC` | Continue last conversation |
| `<leader>ab` | Add current buffer as context |
| `<leader>as` (visual) | Send selected text to Claude |
| `<leader>as` (in NvimTree) | Add file from tree as context |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Deny diff |

### Completion (nvim-cmp)

| Key | Action |
|---|---|
| `<C-n>` | Next item |
| `<C-p>` | Prev item |
| `<C-y>` | Confirm selection |
| `<C-Space>` | Trigger completion |

---

## Jupyter Notebook Workflow

Open a `.ipynb` file — jupytext auto-converts it to Python with `# %%` cell markers. Saving writes back to `.ipynb`.

For a plain Python file, mark cells with `# %%`:

```python
# %%
import pandas as pd
df = pd.read_csv("data.csv")

# %%
df.head()
```

Then:
1. `<leader>mi` — pick a kernel (e.g. `python3`)
2. `<leader>rc` — run the cell under cursor
3. Output renders inline below the cell

**To update Neovim in the future:**
```bash
curl -Lo ~/bin/nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x ~/bin/nvim.appimage
```
