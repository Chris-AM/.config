return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    { "<leader>nt", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
  },
  opts = {
    window = {
      mappings = {
        ["v"] = "open_vsplit",
        ["<leader>nt"] = "close_window",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
        show_hidden_count = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          -- '.git',
          -- '.DS_Store',
          -- 'thumbs.db',
        },
        never_show = {},
      },
    },
  },
}
