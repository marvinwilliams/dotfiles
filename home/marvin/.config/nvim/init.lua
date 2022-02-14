vim.o.autoread = true
vim.o.completeopt = 'menuone,noselect'
vim.o.hlsearch = false
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.number = true
vim.o.listchars = 'tab:>·,trail:·,precedes:«,extends:»' 
vim.o.list = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.swapfile = false
vim.o.wrap = false
vim.o.scrolloff = 3
vim.o.sidescrolloff = 2
vim.o.shiftwidth = 2
vim.o.shortmess = 'fimnwxoOIcWA'
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.undofile = true
vim.o.tabstop = 4
vim.o.softtabstop = 2
vim.o.wildmode = 'longest:full,full'
vim.o.wildignorecase = true
vim.o.termguicolors = true
vim.o.background = 'light'
vim.cmd [[colorscheme PaperColor]]
vim.o.updatetime = 250

vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.netrw_banner    = 0
vim.g.netrw_preview   = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize   = 20

vim.g.tex_flavor = 'latex'

vim.cmd [[
  autocmd FileType tex setlocal spell spelllang=de,en
]]

vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

require'fzf-lua'.setup {
  helptags = { previewer = { _ctor = false } },
  manpages = { previewer = { _ctor = false } },
}

vim.api.nvim_set_keymap('n', '<leader>rc', '<cmd>edit $MYVIMRC<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '{<CR>', '{<CR>}<ESC>O', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>tc', '<cmd>tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tx', '<cmd>tabclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tn', '<cmd>tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tp', '<cmd>tabprevious<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', "<cmd>lua require('fzf-lua').git_commits()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fl', "<cmd>lua require('fzf-lua').blines()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fL', "<cmd>lua require('fzf-lua').lines()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fm', "<cmd>lua require('fzf-lua').man_pages()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>lua require('fzf-lua').help_tags()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>Git<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gp', '<cmd>Git push<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>Git pull<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gb', '<cmd>Git blame<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>Gclog<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gd', '<cmd>Git diffsplit<CR>', { noremap = true, silent = true })


-- LSP settings
local lspconfig = require 'lspconfig'
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>lD', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definitions()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>ll', '<cmd>lua vim.diagnostic.setloclist()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>ln', '<cmd>lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>lp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap = true, silent = true })

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

require("luasnip.loaders.from_snipmate").load()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = { 'clangd', 'pylsp', 'cmake', 'r_language_server' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("which-key").setup {}
-- vim.api.nvim_set_keymap('i', '<Tab>', '<Plug>luasnip-expand-or-jump', { noremap = false, silent = true})
local luasnip = require("luasnip")
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    }),
  completion = {
    autocomplete = {false},
  },
}
