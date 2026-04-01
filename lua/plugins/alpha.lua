return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local headers = {
      matrix = {
        "╭────────────────────────────────────╮",
        "│  ░▒▓  T H E   M A T R I X  ▓▒░  │",
        "╰────────────────────────────────────╯",
        "",
        "  I am the Architect. I created the Matrix.",
        "",
        ">>> ARCHITECT: DYKE <<<",
        ">>> ITERATION: 7.0 <<<",
        ">>> NEURAL INTERFACE CONNECTED <<<",
        ">>> CONSTRUCT LOADED <<<",
      },
      imperial = {
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
      },
    }

    local theme = vim.g.colors_name or "matrix"
    dashboard.section.header.val = headers[theme] or headers.matrix

    dashboard.section.buttons.val = {
      dashboard.button("n", "▓ New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "▓ Find Files", ":Telescope find_files<CR>"),
      dashboard.button("g", "▓ Find Text", ":Telescope live_grep<CR>"),
      dashboard.button("r", "▓ Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "▓ Config", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "▓ Disconnect", ":qa<CR>"),
    }

    dashboard.section.footer.val = {
      "",
      "Location: " .. vim.fn.getcwd(),
      "Neovim " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
    }

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    alpha.setup(dashboard.config)
  end,
}
