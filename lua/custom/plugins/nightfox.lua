return {
  'EdenEast/nightfox.nvim',
  config = function()
    require('nightfox').setup {
      options = {
        colorblind = {
          enable = true,
          severity = {
            protan = 0.9,
            deutan = 1.0,
          },
        },
      },
    }
  end,
}
