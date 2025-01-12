-- require("init")

-- Check if running in VSCode
if vim.g.vscode then
	local keymap = vim.keymap
	local opts = { silent = true, noremap = true }

	-- Set leader key
	vim.g.mapleader = " "

	-- Basic mappings that work the same in VSCode
	keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
	keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
	keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

	-- Center cursor after C-u and C-d using VSCode commands
	keymap.set(
		"n",
		"<C-d>",
		[[<Cmd>call VSCodeNotify('scrollHalfPageDown')<CR><Cmd>call VSCodeNotify('revealLine', {'lineNumber': line('.'), 'at': 'center'})<CR>]],
		{ silent = true }
	)
	keymap.set(
		"n",
		"<C-u>",
		[[<Cmd>call VSCodeNotify('scrollHalfPageUp')<CR><Cmd>call VSCodeNotify('revealLine', {'lineNumber': line('.'), 'at': 'center'})<CR>]],
		{ silent = true }
	)

	-- Clear search highlight (using VSCode command)
	keymap.set(
		"n",
		"<leader>nh",
		[[<Cmd>call VSCodeNotify('removeSecondaryCursors')<CR>]],
		{ desc = "Clear search highlights" }
	)

	-- Window management (using VSCode commands for better integration)
	keymap.set(
		"n",
		"<leader>sv",
		[[<Cmd>call VSCodeNotify('workbench.action.splitEditorRight')<CR>]],
		{ desc = "Split window vertically" }
	)
	keymap.set(
		"n",
		"<leader>sh",
		[[<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>]],
		{ desc = "Split window horizontally" }
	)
	keymap.set(
		"n",
		"<leader>se",
		[[<Cmd>call VSCodeNotify('workbench.action.evenEditorWidths')<CR>]],
		{ desc = "Make splits equal" }
	)
	keymap.set(
		"n",
		"<leader>sx",
		[[<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>]],
		{ desc = "Close current window" }
	)

	-- Tab management (using VSCode commands)
	keymap.set(
		"n",
		"<leader>to",
		[[<Cmd>call VSCodeNotify('workbench.action.newWindow')<CR>]],
		{ desc = "Open new tab" }
	)
	keymap.set(
		"n",
		"<leader>tx",
		[[<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>]],
		{ desc = "Close current tab" }
	)
	keymap.set(
		"n",
		"<leader>tn",
		[[<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>]],
		{ desc = "Go to next tab" }
	)
	keymap.set(
		"n",
		"<leader>tp",
		[[<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>]],
		{ desc = "Go to previous tab" }
	)
	keymap.set(
		"n",
		"<leader>tf",
		[[<Cmd>call VSCodeNotify('workbench.action.files.newUntitledFile')<CR>]],
		{ desc = "Open current buffer in new tab" }
	)

	vim.wo.number = true
	vim.wo.relativenumber = true
end
