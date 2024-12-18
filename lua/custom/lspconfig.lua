local lspconfig = 

require 'lspconfig'.clangd.setup {

    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        --on_attach(client, bufnr)
    end,
}
