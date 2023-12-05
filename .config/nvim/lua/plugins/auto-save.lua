return {
    {
        "Pocco81/auto-save.nvim",
        -- enabled=false,
        opts = {
            execution_message = {
                message = function()
                    return ""
                end,
                dim = 0.18,
                cleaning_interval = 1250,
            },
            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")

                -- don't save for `sql` file types
                if utils.not_in(fn.getbufvar(buf, "&filetype"), {'sql'}) then
                    return true
                end
                return false
            end
        },
    },
}

