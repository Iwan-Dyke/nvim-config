return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local headers = {
      matrix = {
        [[  ░▒▓█ T H E   M A T R I X █▓▒░  ]],
        [[                                   ]],
        [[   Wake up, Iwan...                ]],
        [[   The Matrix has you...           ]],
      },
      imperial = {
        [[  ██╗███╗   ███╗██████╗ ███████╗██████╗ ██╗ █████╗ ██╗  ]],
        [[  ██║████╗ ████║██╔══██╗██╔════╝██╔══██╗██║██╔══██╗██║  ]],
        [[  ██║██╔████╔██║██████╔╝█████╗  ██████╔╝██║███████║██║  ]],
        [[  ██║██║╚██╔╝██║██╔═══╝ ██╔══╝  ██╔══██╗██║██╔══██║██║  ]],
        [[  ██║██║ ╚═╝ ██║██║     ███████╗██║  ██║██║██║  ██║███████╗]],
        [[  ╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝]],
        [[        The Emperor's will be done.                      ]],
      },
    }

    local quotes = {
      matrix = {
        "\"There is no spoon.\"",
        "\"I know kung fu.\" — Neo",
        "\"Free your mind.\" — Morpheus",
        "\"Not like this... not like this.\" — Switch",
        "\"The Matrix is everywhere. It is all around us.\" — Morpheus",
        "\"Choice. The problem is choice.\" — Neo",
        "\"Everything that has a beginning has an end.\" — The Oracle",
        "\"To deny our own impulses is to deny the very thing that makes us human.\" — Mouse",
        "\"What do all men with power want? More power.\" — The Oracle",
        "\"Hope. It is the quintessential human delusion.\" — The Architect",
        "\"You've been living in a dream world, Neo.\" — Morpheus",
        "\"Guns. Lots of guns.\" — Neo",
      },
      imperial = {
        "\"The ability to destroy a planet is insignificant next to the power of the Force.\"",
        "\"I find your lack of faith disturbing.\" — Darth Vader",
        "\"Be careful not to choke on your aspirations.\" — Darth Vader",
        "\"The dark side of the Force is a pathway to many abilities some consider to be unnatural.\"",
        "\"Everything is proceeding as I have foreseen.\" — The Emperor",
        "\"You don't know the power of the dark side.\" — Darth Vader",
        "\"There is no escape. Don't make me destroy you.\" — Darth Vader",
        "\"Power! Unlimited power!\" — The Emperor",
        "\"The Force is strong with this one.\" — Darth Vader",
        "\"Now, young Skywalker, you will die.\" — The Emperor",
        "\"Perhaps I can find new ways to motivate them.\" — Darth Vader",
        "\"We shall double our efforts.\" — Moff Jerjerrod",
      },
    }

    local function git_branch()
      local branch = vim.fn.system("git -C " .. vim.fn.getcwd() .. " branch --show-current 2>/dev/null"):gsub("\n", "")
      if branch == "" then return nil end
      return " " .. branch
    end

    dashboard.section.buttons.val = {
      dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("g", "  Grep text", ":Telescope live_grep<CR>"),
      dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("p", "  Projects", ":Telescope oldfiles cwd_only=true<CR>"),
      dashboard.button("c", "  Config", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("k", "  Keymaps", ":Telescope keymaps<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    local cheatsheet = {
      type = "text",
      val = {
        "─── Quick Reference ───────────────────────────",
        " <leader>f Find    <leader>d Debug   <leader>g Git",
        " <leader>h Hunks   <leader>c Code    <leader>x Trouble",
        " <leader>t Term    <leader>m MD      <leader>n Notebook",
        " gd definition  gr references  K hover  <C-\\> terminal",
        "───────────────────────────────────────────────",
      },
      opts = { hl = "AlphaFooter", position = "center" },
    }

    local is_deck = require("config.profile").is_deck()
    local theme = vim.g.colors_name or "matrix"
    local theme_quotes = quotes[theme] or quotes.matrix
    local random_quote = {
      type = "text",
      val = { theme_quotes[math.random(#theme_quotes)] },
      opts = { hl = "AlphaHeader", position = "center" },
    }

    if is_deck then
      dashboard.section.header.val = { "[ " .. theme .. " ]" }
    else
      dashboard.section.header.val = headers[theme] or headers.matrix
    end

    local function footer_val()
      local stats = require("lazy").stats()
      local ver = vim.version()
      local branch = git_branch()
      local parts = {
        string.format("⚡ %d/%d plugins in %dms", stats.loaded, stats.count, stats.startuptime),
        string.format("Neovim v%d.%d.%d", ver.major, ver.minor, ver.patch),
        vim.fn.fnamemodify(vim.fn.getcwd(), ":~"),
      }
      if branch then table.insert(parts, branch) end
      return { table.concat(parts, " │ ") }
    end

    local layout = {
      { type = "padding", val = 1 },
      dashboard.section.header,
      { type = "padding", val = 1 },
      random_quote,
      { type = "padding", val = 1 },
      dashboard.section.buttons,
    }

    if not is_deck then
      table.insert(layout, { type = "padding", val = 1 })
      table.insert(layout, cheatsheet)
    end

    table.insert(layout, { type = "padding", val = 1 })
    table.insert(layout, dashboard.section.footer)

    dashboard.config.layout = layout

    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      once = true,
      callback = function()
        dashboard.section.footer.val = footer_val()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    alpha.setup(dashboard.config)
  end,
}
