local flutter_status, flutter_tools = pcall(require, "flutter-tools")
if not flutter_status then
  print("no hay flutter")
  return
end

flutter_tools.setup{
  widget_guides = {
    enabled = true,
    debug = false,
  },
  lsp = {
    on_attach = function()

      -- set up mappings for flutter commands
      local bufnr = 0  -- current buffer
      local opts = { noremap=true, silent=true }

      -- flutter commands
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fx', ':FlutterRun<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ft', ':FlutterTest<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fa', ':FlutterAnalyze<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fp', ':FlutterPackagesGet<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fo', ':FlutterOutlineToggle<cr>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>fu', ':FlutterDevToolsOpen<cr>', opts)
    end
  }
}


