return {
    { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "cmake",
                "cpp",
                "css",
                "fish",
                "bash",
                "gitignore",
                "go",
                "http",
                "rust",
                "sql",
                "javascript",
                "typescript",
                "tsx",
                "lua"
            },
            sync_insatll = false,
            highlight = { enable = true },
            indent = { enable = true }
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)

            -- MDX
            vim.filetype.add({
                extension = {
                    mdx = "mdx",
                },
            })
            vim.treesitter.language.register("markdown", "mdx")
        end,
    }
}
