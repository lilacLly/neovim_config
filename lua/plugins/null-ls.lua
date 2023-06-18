return {
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = { "BufReadPre", "BufNewFile", "BufWritePre" },
        opts = function()
            local nls = require("null-ls")
            return {
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.shfmt,
                },
            }
        end,
    },
}
