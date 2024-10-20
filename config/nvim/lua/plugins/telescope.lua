return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        keys = {
            { "<leader>pf", function() require("telescope.builtin").find_files() end, desc = "Telescope find files" },
            { "<C-p>", function() require("telescope.builtin").git_files() end, desc = "Telescope find git files" },
            { "<leader>ps", function() require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ") }) end, desc = "Telescope find files" }
        }
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
