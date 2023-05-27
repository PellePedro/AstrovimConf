return {
  "anuvyklack/hydra.nvim",
  module = { "hydra" },
  event = { "BufReadPre" },
  disable = true,
  dependencies = {
    "anuvyklack/keymap-layer.nvim",
  },
  commit = "ea91aa820a6cecc57bde764bb23612fff26a15de",
  config = function() require "user.core.hydra" end,
}
