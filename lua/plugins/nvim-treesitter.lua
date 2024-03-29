return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            ensure_installed = {
                "vim",
                "lua",
                "go",
                "python",
                "cpp",
            },
        },
    },
}
