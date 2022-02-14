local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    print('error cmp')
    return
end


local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    print('error luasnip')
    return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
    print('error lspkind')
    return
end

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },

    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },

        -- Tab mapping
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
      end
    },

    formatting = {
        format = lspkind.cmp_format({
            mode = 'text_symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                return vim_item
            end
        })
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },

    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },

    documentation = {
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },

    experimental = {
        ghost_text = false,
        native_menu = false,
    },

}
