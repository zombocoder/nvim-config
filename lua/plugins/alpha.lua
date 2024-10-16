return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.startify'

    dashboard.section.header.val = {
      [[   _______  _______  _______  ______   _______  _______  _______  ______   _______  _______  ]],
      [[  / ___   )(  ___  )(       )(  ___ \ (  ___  )(  ____ \(  ___  )(  __  \ (  ____ \(  ____ ) ]],
      [[  \/   )  || (   ) || () () || (   ) )| (   ) || (    \/| (   ) || (  \  )| (    \/| (    )| ]],
      [[      /   )| |   | || || || || (__/ / | |   | || |      | |   | || |   ) || (__    | (____)| ]],
      [[     /   / | |   | || |(_)| ||  __ (  | |   | || |      | |   | || |   | ||  __)   |     __) ]],
      [[    /   /  | |   | || |   | || (  \ \ | |   | || |      | |   | || |   ) || (      | (\ (    ]],
      [[   /   (_/\| (___) || )   ( || )___) )| (___) || (____/\| (___) || (__/  )| (____/\| ) \ \__ ]],
      [[  (_______/(_______)|/     \||/ \___/ (_______)(_______/(_______)(______/ (_______/|/   \__/ ]],
      [[                                                                                             ]],
    }

    alpha.setup(dashboard.opts)
  end,
}
