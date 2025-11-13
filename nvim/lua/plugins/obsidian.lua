return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- this will be removed in 4.0.0
        workspaces = {
            {
                name = "personal",
                path = "~/Obsidian-Vault/",
            },
        },

        -- see below for full list of options 👇
        daily_notes = {
            -- Optional, if you keep daily notes in a separate directory.
            folder = "Timestamps",
            -- Optional, if you want to change the date format for the ID of daily notes.
            date_format = "%Y/%m-%B/%Y-%m-%d-%A",
            -- Optional, if you want to change the date format of the default alias of daily notes.
            -- alias_format = "%B %-d, %Y",
            -- Optional, default tags to add to each new daily note created.
            -- default_tags = { "daily-notes" },
            -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
            template = "Templates/Daily Notes.md",
        },

        templates = {
            folder = "Templates",
        },
    },
}
