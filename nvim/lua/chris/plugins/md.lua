-- import the plugin safely
local md_preview_status, md_preview = pcall(require, "iamcco/markdown-preview.nvim")
if not md_preview_status then
	print("Failed to load markdown-preview.nvim")
	return
end

-- map keybindings for markdown-preview.nvim
vim.api.nvim_set_keymap("n", "<leader>mp", "<Plug>MarkdownPreviewToggle", {})
vim.api.nvim_set_keymap("n", "<leader>mi", "<Plug>MarkdownPreviewInsertImage", {})
vim.api.nvim_set_keymap("n", "<leader>ml", "<Plug>MarkdownPreviewInsertLink", {})

-- configure the plugin
md_preview.setup({})
