-- If you don't already have a preferred neovim LSP setup, you may want
-- to reference the nvim-lspconfig documentation, which can be found at:
-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
-- For completeness (of showing this plugin's settings), we show
-- a barebones LSP attach handler (which will give you Lean LSP
-- functionality in attached buffers) here:

require('lean').setup{
  -- Enable the Lean language server(s)?
  --
  -- false to disable, otherwise should be a table of options to pass to
  --  `leanls` and/or `lean3ls`.
  --
  -- See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#leanls for details.

  -- Lean 4
  lsp = { on_attach = on_attach },

  -- Lean 3
  lsp3 = { on_attach = on_attach },

  -- Abbreviation support
  abbreviations = {
    -- Set one of the following to true to enable abbreviations
    builtin = true, -- built-in expander
    compe = false, -- nvim-compe source
    snippets = false, -- snippets.nvim source
    -- additional abbreviations:
    extra = {
      -- Add a \wknight abbreviation to insert ♘
      --
      -- Note that the backslash is implied, and that you of
      -- course may also use a snippet engine directly to do
      -- this if so desired.
      wknight = '♘',
    },
    -- Change if you don't like the backslash
    -- (comma is a popular choice on French keyboards)
    leader = '\\',
  },

  -- Enable suggested mappings?
  --
  -- false by default, true to enable
  mappings = true,

  -- Infoview support
  infoview = {
    -- Automatically open an infoview on entering a Lean buffer?
    autoopen = true,
    -- Set the infoview windows' widths
    width = 50,
  },

  -- Progress bar support
  progress_bars = {
    -- Enable the progress bars?
    enable = true,
    -- Use a different priority for the signs
    priority = 10,
  },
}
