-- set leader key to space
vim.g.mapleader = " "

---------------------
-- General Keymaps
---------------------

local keymap = vim.keymap -- for conciseness

-- moving around panes
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- use jk to exit
keymap.set("i", "jk", "<ESC>")
keymap.set("v", "jk", "<ESC>")
keymap.set("t", "jk", "<C-\\><C-n>")

-- Fancy macros
-- from https://github.com/evantravers/dotfiles/blob/c5e9a379e02a939fdf5a264d4e04c4e6cf9aa33b/nvim/.config/nvim/.vimrc#L61
keymap.set("n", "Q", "@q")
keymap.set("v", "Q", ":norm @q<cr>")

-- using H and L for beginning/end of line
keymap.set("n", "H", "^")
keymap.set("v", "H", "^")
keymap.set("n", "L", "$")
keymap.set("v", "L", "$")

-- HJKL as amplified versions of hjkl
-- from https://nanotipsforvim.prose.sh/motion-setup--hjkl-as-amplified-hjkl
vim.keymap.set("n", "J", "6j")
vim.keymap.set("v", "J", "6j")
vim.keymap.set("n", "K", "6k")
vim.keymap.set("v", "K", "6k")

vim.keymap.set("n", "M", "J") -- mnemonic: [M]erge
vim.keymap.set("n", "<leader>h", "K") -- mnemonic: [h]over

-- Remapping textobjs (from https://nanotipsforvim.prose.sh/remapping-all-your-textobjs-for-speed)
-- around
vim.keymap.set("o", "ar", "a]") -- [r]ectangular bracket
vim.keymap.set("o", "ac", "a}") -- [c]urly brace
vim.keymap.set("o", "am", "aW") -- [m]assive word
vim.keymap.set("o", "aq", 'a"') -- [q]uote
vim.keymap.set("o", "az", "a'") -- [z]ingle quote

-- inside
vim.keymap.set("o", "ir", "i]") -- [r]ectangular bracket
vim.keymap.set("o", "ic", "i}") -- [c]urly brace
vim.keymap.set("o", "im", "iW") -- [m]assive word
vim.keymap.set("o", "iq", 'i"') -- [q]uote
vim.keymap.set("o", "iz", "i'") -- [z]ingle quote

-- Center search result
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")
--
-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- resizing windows
keymap.set("n", "<leader><left>", ":vertical resize -5<cr>")
keymap.set("n", "<leader><right>", ":vertical resize +5<cr>")
keymap.set("n", "<leader><down>", ":resize -5<cr>")
keymap.set("n", "<leader><up>", ":resize +5<cr>")

keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height

local secrets = require("joschua.secrets")

keymap.set(
	"n",
	"<leader>k",
	"gg/kontentId<cr>WyW:!open 'https://app.kontent.ai/"
		.. secrets.kontentId
		.. "/content-inventory/00000000-0000-0000-0000-000000000000/content/<c-r>\"'<cr>"
) -- open kontent id in browser
