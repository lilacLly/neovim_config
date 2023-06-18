return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        extensions = { "nvim-tree", "lazy", "toggleterm" },
        sections = {
              lualine_c = {
              "filename",
              {
                "lsp_progress",
                spinner_symbols = { " ", " ", " ", " ", " ", " " },
              },
              },
              lualine_x = {
              "filesize",
              {
                "fileformat",
                symbols = {
                  unix = '', -- e712
                  dos = '', -- e70f
                  mac = '', -- e711
                },
              },
              "encoding",
              "filetype",
              },
          },
    },
}
