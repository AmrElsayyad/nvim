return {
    "AmrElsayyad/sortjson.nvim",
    cmd = {
        "SortJSONByAlphaNum",
        "SortJSONByAlphaNumReverse",
        "SortJSONByKeyLength",
        "SortJSONByKeyLengthReverse",
    },
    -- options with default values
    opts = {
        log_level = "WARN", -- log level, see `:h vim.log.levels`, print error info when parsing json failed
    },
}
