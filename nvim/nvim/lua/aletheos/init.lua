-- Walk by faith, not by sight
print("διὰ πίστεως γὰρ περιπατοῦμεν, οὐ διὰ εἴδους.")
require("aletheos.remap")

--- --- --- --- ---
--- Settings ---  -
--- --- --- --- ---
-- Numbers
vim.opt.number = true
-- Relative Numbers
vim.opt.relativenumber = true

--- Highlight Yank
vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('highlight_yank', {}),
	callback = function()
		vim.highlight.on_yank{higroup='IncSearch', timeout=700}
	end,
})

-- Use python interpreter
vim.g.pyhton3_host_prog = '~/.venvs/neovim/bin/python'
