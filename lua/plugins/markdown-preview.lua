return {
  'toppair/peek.nvim',
  event = 'VeryLazy',
  build = {
    'DENO_CERT=$HOME/.config/certs/dvla-ca-bundle.pem deno task --quiet build:fast',
    -- Patch: add 'graph' keyword to mermaid detection regex
    [[sed -i '' 's/charttype>flowchart|/charttype>graph|flowchart|/' public/main.bundle.js]],
  },
  keys = {
    { '<leader>mp', function() require('peek').open() end, desc = 'Markdown Preview' },
    { '<leader>mP', function() require('peek').close() end, desc = 'Close Markdown Preview' },
  },
  opts = {
    app = 'browser',
    theme = 'dark',
    filetype = { 'markdown', 'mermaid' },
  },
}
