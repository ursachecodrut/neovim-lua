local status_ok, treesitter = pcall(require, 'nvim-treesitter.config')
if not status_ok then
    print('error treesitter')
    return
end

treesitter.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- List of parsers to ignore installing
    ignore_install = { "" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- list of language that will be disabled
        disable = { "" },

        additional_vim_regex_highlighting = true,
    },
}
