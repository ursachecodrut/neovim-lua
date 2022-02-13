local colorscheme = 'tokyonight'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
    vim.notify('colorscheme ' .. colorcheme .. 'not found!')
    return
end
