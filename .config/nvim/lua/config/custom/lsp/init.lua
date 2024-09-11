local A = require("config.custom.lsp.on_attach")
local M = {
    bashls = {},
    cssls = {},
    emmet_language_server = {},
    html = {},
    jsonls = {},
    lua_ls = {
        settings = {
            Lua = {
                hint = {
                    enable = true,
                    arrayIndex = "Disable"
                }
            }
        }
    },
    rust_analyzer = {
        settings = {
            ['rust-analyzer'] = {
                diagnostics = {
                    enable = false;
                }
            }
        }
    },
    svelte = {},
    tailwindcss = {},
    texlab = {},
}

for key, _ in pairs(M) do
    M[key].on_attach = A.on_attach
    M[key].capabilities = A.capabilities
    M[key].capabilities.textDocument.completion.completionItem.snippetSupport = true

  end

return M
