--- --- --- --- --- --- --- --- ---
 -- Global user config for nvim --
--- --- --- --- --- --- --- --- ---

-- Set Leader:
vim.g.mapleader = " "

-- Back to explorer
vim.keymap.set("n", "<leader>h", vim.cmd.Ex)


-- Yank
-- To system
vim.keymap.set("n", "<leader>y", "\"*y")
vim.keymap.set("v", "<leader>y", "\"*y")

-- Paste
-- From system
vim.keymap.set("n", "<leader>p", "\"*p")
vim.keymap.set("v", "<leader>p", "\"*p")

-- Enable Twilight mode
vim.keymap.set("n", "<leader>z", "<cmd>TwilightEnable<CR>")
vim.keymap.set("n", "<leader><leader>z", "<cmd>TwilightDisable<CR>")

-- Format file
vim.keymap.set("n", "<leader>r", "=ap")
