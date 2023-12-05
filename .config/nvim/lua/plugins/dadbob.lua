return {
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
            vim.g.db_ui_save_location = vim.fn.getcwd()

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "dbui"
                },
                callback = function()
                    vim.keymap.set("n", "<leader>W", "<Plug>(DBUI_SelectLineVsplit)")
                end,
            })

            require("conform").formatters_by_ft = {
                sql = { "sqlfluff" },
            }

            vim.g.completion_matching_ignore_case = 1
        end,
    },
}
