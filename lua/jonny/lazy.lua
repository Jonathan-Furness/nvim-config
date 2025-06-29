local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup Lazy and define LazyFile event
require("lazy").setup({
	{ import = "jonny.plugins" },
	{ import = "jonny.plugins.lsp" },
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

-- Define LazyFile event after lazy.nvim is loaded
-- This allows plugins to use event = "LazyFile"
local Event = require("lazy.core.handler.event")

-- Create LazyFile event that triggers on file-related events
Event.mappings.LazyFile = {
	id = "LazyFile",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
}
Event.mappings["User LazyFile"] = Event.mappings.LazyFile
