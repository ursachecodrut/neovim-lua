local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    print('lspconfig')
	return
end

require("plugins.lsp.lsp-installer")
require("plugins.lsp.handlers").setup()
