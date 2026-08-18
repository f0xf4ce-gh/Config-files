-- ~/.config/nvim/lua/plugins/grim-banner-nerdfont.lua
-- "grim" -- Nerd Font edition. Frostbitten flame above, ice below.
--
-- Glyphs used, by Nerd Font name and codepoint:
--   U+E0C0  nf-pl-flame_thick    top border
--   U+E0CA  nf-pl-ice_waveform   bottom border
--   U+F002 search  U+F02D book  U+F0E7 bolt  U+F1DA history
--   U+F186 moon_o  U+F013 cog   U+F06D fire  U+F011 power_off
--
-- Coverage varies between Nerd Font builds. If any of these render as a
-- tofu box, look the name up on nerdfonts.com/cheat-sheet and swap it.

local grim = [[


 ██████╗  ██████╗               ██╗    ███╗   ███╗
██╔════╝  ██╔══██╗ ██╗   ██╗    ██║    ████╗ ████║
██║  ███╗ ██████╔╝ ██║   ██║    ██║    ██╔████╔██║
██║   ██║ ██╔══██╗ ╚██╗ ██╔╝ ████████╗ ██║╚██╔╝██║
╚██████╔╝ ██║  ██║  ╚████╔╝  ╚══██║══╝ ██║ ╚═╝ ██║
 ╚═════╝  ╚═╝  ╚═╝   ╚═══╝      ╚═╝    ╚═╝     ╚═╝


]]

return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = grim,
          keys = {
            { icon = "  ", key = "f", desc = "Summon File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = "  ", key = "n", desc = "Blank Grimoire", action = ":ene | startinsert" },
            { icon = "  ", key = "g", desc = "Grep the Abyss", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = "  ", key = "r", desc = "Recent Rituals", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = "  ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "  ", key = "c", desc = "Grimoire Config", action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })" },
            { icon = "  ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = "  ", key = "q", desc = "Return to Dust", action = ":qa" },
          },
        },
        sections = {
          { section = "header", padding = 2 },
          -- gap = 1 puts a blank line between each entry;
          -- padding = 2 adds breathing room above and below the block.
          { section = "keys", gap = 1, padding = 2, indent = 2 },
          { section = "startup", padding = 1 },
        },
      },
    },
  },
}
