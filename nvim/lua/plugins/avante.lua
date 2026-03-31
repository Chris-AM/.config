return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "stevearc/dressing.nvim",
    "HakonHarnes/img-clip.nvim",
    "MeanderingProgrammer/render-markdown.nvim",
  },
  opts = {
    provider = "claude",
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-sonnet-4-6",
      timeout = 30000,
      temperature = 0,
      max_tokens = 8096,
    },
  },
}
