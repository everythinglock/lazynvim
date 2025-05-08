# Neovim Configuration

A modern Neovim configuration with AI integration and note-taking capabilities.

## 🚀 Quick Start

1. Install dependencies:
```bash
# Required components
brew install neovim git ripgrep
# Python support (optional)
pip install pynvim
```

2. Clone this config:
```bash
git clone https://github.com/yourname/your-repo ~/.config/nvim
```

3. First run auto-install:
```bash
nvim --headless "+Lazy! sync" +qa
```

## 📝 Neorg Note System

### Basic Usage
```text
<leader>nn  # Create today's journal
<leader>nt  # Create tomorrow's journal
<leader>ni  # Open note index
```

### Workspace Config
Default storage paths:
```lua
workspaces = {
  notes = "~/Documents/notes",  # Regular notes
  gtd = "~/Documents/gtd",      # Task management
  journal = "~/Documents/journal" # Journal system
}
```

## 🧠 AI Integration

### Backend Setup
```bash
# Add to shell config
export MN_API_KEY="minimax_api_key"
export YW_API_KEY="yunwu_api_key"
```

### Interaction Modes
| Mode        | Shortcut     | Description            |
|-------------|-------------|-----------------------|
| Normal      | `<leader>ac` | Toggle chat window     |
| Normal      | `<leader>aa` | Show code actions      |
| Visual      | `<C-a>`      | AI actions on selection|
| Visual      | `<C-c>`      | Send code to chat      |

## ⚙️ Configuration

### Key Customizations
```text
i, ,        Insert comma with undo point
i, .        Insert period with undo point
i, ;        Insert semicolon with undo point
i, C-h      Move left in insert mode
i, C-l      Move right in insert mode
i, C-j      Move down in insert mode
i, C-k      Move up in insert mode

<C-/>       Open fish terminal
<C-\>       Open default terminal
;J          Escape any mode
```

### Performance
Disabled plugins:
```text
gzip, tarPlugin, tohtml, tutor, zipPlugin
```

### Theme
Default tokyonight theme config:
```lua
-- lua/config/lazy.lua
install = { colorscheme = { "tokyonight" } }
```

## 🔄 Maintenance
Update plugins:
```vim
:Lazy sync
```
