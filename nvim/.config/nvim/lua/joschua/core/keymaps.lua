-- set leader key to space
vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------

local keymap = vim.keymap -- for conciseness

-- moving around panes
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left pane" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom pane" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top pane" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right pane" })

-- use jk to exit
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("v", "jk", "<ESC>", { desc = "Exit visual mode with jk" })
keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode with jk" })

-- Fancy macros
-- from https://github.com/evantravers/dotfiles/blob/c5e9a379e02a939fdf5a264d4e04c4e6cf9aa33b/nvim/.config/nvim/.vimrc#L61
keymap.set("n", "Q", "@q", { desc = "Play quick macro" })
keymap.set("v", "Q", ":norm @q<cr>", { desc = "Play quick macro" })

keymap.set("n", "H", "^", { desc = "Go to beginning of line" })
keymap.set("v", "H", "^", { desc = "Go to beginning of line" })
keymap.set("n", "L", "$", { desc = "Go to end of line" })
keymap.set("v", "L", "$", { desc = "Go to end of line" })

-- HJKL as amplified versions of hjkl
-- from https://nanotipsforvim.prose.sh/motion-setup--hjkl-as-amplified-hjkl
vim.keymap.set("n", "J", "6j", { desc = "Move down 6 lines" })
vim.keymap.set("v", "J", "6j", { desc = "Move down 6 lines" })
vim.keymap.set("n", "K", "6k", { desc = "Move up 6 lines" })
vim.keymap.set("v", "K", "6k", { desc = "Move up 6 lines" })

vim.keymap.set("n", "M", "J", { desc = "Merge lines" }) -- mnemonic: [M]erge
vim.keymap.set("n", "<leader>h", "K", { desc = "Hover" }) -- mnemonic: [h]over

-- Remapping textobjs (from https://nanotipsforvim.prose.sh/remapping-all-your-textobjs-for-speed)
-- around
vim.keymap.set("o", "ar", "a]", { desc = "Around bracket" }) -- [r]ectangular bracket
vim.keymap.set("o", "ac", "a}", { desc = "Around curly brace" }) -- [c]urly brace
vim.keymap.set("o", "am", "aW", { desc = "Around Word" }) -- [m]assive word
vim.keymap.set("o", "aq", 'a"', { desc = "Around quote" }) -- [q]uote
vim.keymap.set("o", "az", "a'", { desc = "Around single quote" }) -- [z]ingle quote

-- inside
vim.keymap.set("o", "ir", "i]", { desc = "Inside rectangular bracket" }) -- [r]ectangular bracket
vim.keymap.set("o", "ic", "i}", { desc = "Inside curly brace" }) -- [c]urly brace
vim.keymap.set("o", "im", "iW", { desc = "Inside Word" }) -- [m]assive word
vim.keymap.set("o", "iq", 'i"', { desc = "Inside quote" }) -- [q]uote
vim.keymap.set("o", "iz", "i'", { desc = "Inside single quote" }) -- [z]ingle quote

keymap.set("n", "n", "nzz", { desc = "Center search result" })
keymap.set("n", "N", "Nzz", { desc = "Center search result" })
--
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "x", '"_x', { desc = "Delete single character without copying into register" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split window" })

-- resizing windows
keymap.set("n", "<leader><left>", ":vertical resize -5<cr>", { desc = "Decrease window width" })
keymap.set("n", "<leader><right>", ":vertical resize +5<cr>", { desc = "Increase window width" })
keymap.set("n", "<leader><down>", ":resize -5<cr>", { desc = "Decrease window height" })
keymap.set("n", "<leader><up>", ":resize +5<cr>", { desc = "Increase window height" })

keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width & height" })
