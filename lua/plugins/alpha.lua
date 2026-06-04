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
      ['wayne-tech'] = {
        [[                            ,.ood888888888888boo.,                ]],
        [[                       .od888P^""            ""^Y888bo.          ]],
        [[                   .od8P''   ..oood88888888booo.    ``Y8bo.      ]],
        [[                .odP'"  .ood8888888888888888888888boo.  "`Ybo.   ]],
        [[              .d8'   od8'd888888888f`8888't888888888b`8bo   `Yb. ]],
        [[             d8'  od8^   8888888888[  `'  ]8888888888   ^8bo  `8b]],
        [[           .8P  d88'     8888888888P      Y8888888888     `88b  Y8.]],
        [[          d8' .d8'       `Y88888888'      `88888888P'       `8b. `8b]],
        [[         .8P .88P            """"            """"            Y88. Y8.]],
        [[         88  888                                              888  88]],
        [[         88  888                                              888  88]],
        [[         88  888.        ..                        ..        .888  88]],
        [[         `8b `88b,     d8888b.od8bo.      .od8bo.d8888b     ,d88' d8']],
        [[          Y8. `Y88.    8888888888888b    d8888888888888    .88P' .8P]],
        [[           `8b  Y88b.  `88888888888888  88888888888888'  .d88P  d8']],
        [[             Y8.  ^Y88bod8888888888888..8888888888888bod88P^  .8P]],
        [[              `Y8.   ^Y888888888888888888888888888888P^   .8P']],
        [[                `^Yb.,  `^^Y8888888888888888888P^^'  ,.dP^']],
        [[                   `^Y8b..   ``^^^Y88888P^^^'    ..d8P^']],
        [[                       `^Y888bo.,            ,.od888P^']],
        [[                            "`^^Y888888888888P^^'"     ]],
        [[                                                       ]],
        [[                       W A Y N E   T E C H             ]],
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
      ['wayne-tech'] = {},
    }

    -- Wayne-Tech: generate system info instead of quotes
    local function wayne_tech_status()
      local host = vim.fn.hostname()
      local date = os.date("%Y-%m-%d %H:%M")
      local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
      local branch = vim.fn.system("git -C " .. vim.fn.getcwd() .. " branch --show-current 2>/dev/null"):gsub("\n", "")
      local lines = {
        "┌─── SYSTEM STATUS ───────────────────────┐",
        "│  NODE: " .. host .. string.rep(" ", math.max(0, 33 - #host)) .. "│",
        "│  TIME: " .. date .. string.rep(" ", math.max(0, 33 - #date)) .. "│",
        "│  PATH: " .. cwd:sub(1, 33) .. string.rep(" ", math.max(0, 33 - #cwd:sub(1, 33))) .. "│",
      }
      if branch ~= "" then
        table.insert(lines, "│  BRANCH: " .. branch:sub(1, 31) .. string.rep(" ", math.max(0, 31 - #branch:sub(1, 31))) .. "│")
      end
      table.insert(lines, "│  STATUS: ONLINE" .. string.rep(" ", 25) .. "│")
      table.insert(lines, "└──────────────────────────────────────────┘")
      return lines
    end

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
    local cs_name = vim.g.colors_name or "matrix"
    local theme_quotes = quotes[cs_name] or quotes.matrix
    local random_quote
    if cs_name == "wayne-tech" then
      random_quote = {
        type = "text",
        val = wayne_tech_status(),
        opts = { hl = "AlphaFooter", position = "center" },
      }
    else
      random_quote = {
        type = "text",
        val = { theme_quotes[math.random(#theme_quotes)] },
        opts = { hl = "AlphaHeader", position = "center" },
      }
    end

    if is_deck then
      dashboard.section.header.val = { "[ " .. cs_name .. " ]" }
    else
      dashboard.section.header.val = headers[cs_name] or headers.matrix
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
