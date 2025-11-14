return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    
    -- Set header
    dashboard.section.header.val = {
      "██╗███╗   ███╗██████╗ ███████╗██████╗ ██╗ █████╗ ██╗     ",
      "██║████╗ ████║██╔══██╗██╔════╝██╔══██╗██║██╔══██╗██║     ",
      "██║██╔████╔██║██████╔╝█████╗  ██████╔╝██║███████║██║     ",
      "██║██║╚██╔╝██║██╔═══╝ ██╔══╝  ██╔══██╗██║██╔══██║██║     ",
      "██║██║ ╚═╝ ██║██║     ███████╗██║  ██║██║██║  ██║███████╗",
      "╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝",
      "",
      "           IMPERIAL DEVELOPMENT COMMAND INTERFACE",
      "                 The Emperor's will be done.",
      "",
      ">>> GRAND MOFF DYKE - AUTHORIZED <<<",
      ">>> CLEARANCE LEVEL: OMEGA BLACK <<<",
      ">>> DEATH STAR COMMAND SYSTEMS ONLINE <<<",
      ">>> TACTICAL OPERATIONS CENTER READY <<<",
    }
    
    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("n", "  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find Files", ":Telescope find_files<CR>"),
      dashboard.button("g", "  Find Text", ":Telescope live_grep<CR>"),
      dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "  Config", ":e ~/.config/nvim-dev/init.lua<CR>"),
      dashboard.button("h", "  Home Dir", ":cd ~ | Telescope find_files<CR>"),
      dashboard.button("d", "  Dev Config", ":cd ~/.config/nvim-dev | Telescope find_files<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }
    
    -- Add footer with Imperial info
    dashboard.section.footer.val = {
      "",
      "Current Sector: " .. vim.fn.getcwd(),
      "Neovim Version: " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
    }
    
    -- Set custom highlights for Imperial theme
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#cccccc" })
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#ff6600" })
    
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    
    alpha.setup(dashboard.config)
  end,
}
