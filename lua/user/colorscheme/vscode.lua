return {
  { -- Theme inspired by VScode
    'Mofiqul/vscode.nvim',
    priority = 1000,
    opts = {
      italic_comments = true, -- Enable italic comment
      -- Override colors (see ./lua/vscode/colors.lua)
      color_overrides = {
        vscGreen = '#767676',
      },
    },
  },
}
